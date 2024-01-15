import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/app/chapter_provider.dart';
import 'package:doc_truyen_online_mobile/components/chapter/chapter_config_info.dart';
import 'package:doc_truyen_online_mobile/components/chapter/chapter_config_setting.dart';
import 'package:doc_truyen_online_mobile/components/chapter/chapter_view_horizon.dart';
import 'package:doc_truyen_online_mobile/components/chapter/chapter_view_vertical.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/data/models/chapter.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/helpers/toast.dart';
import 'package:doc_truyen_online_mobile/services/chapter_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterPage extends StatefulWidget {
  final String slug;
  final int index;

  const ChapterPage({super.key, required this.slug, required this.index});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  late Future<Chapter> chapterFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chapterFuture = fetchChapter();
  }

  void showChapterConfig(context, {required Chapter chapter}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: const TabBar(
                labelPadding: EdgeInsets.all(5),
                tabs: [
                  Tab(
                    child: Text(
                      "Thông tin",
                      style: AppText.subtitle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Cài đặt",
                      style: AppText.subtitle,
                    ),
                  ),
                ],
              ),
              body: TabBarView(
                children: [
                  ChapterConfigInfo(
                    chapter: chapter,
                    onReload: () {},
                  ),
                  const ChapterConfigSetting(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  int? nextChapterIndex(int? lastChapterIndex) {
    int? index = widget.index;
    if (lastChapterIndex != null && index < lastChapterIndex) {
      index = index + 1;
      return index;
    }
    return null;
  }

  int? previousChapterIndex(int? firstChapterIndex) {
    int? index = widget.index;
    if (firstChapterIndex != null && index > firstChapterIndex) {
      index = index - 1;
      return index;
    }
    return null;
  }

  void onNextChapter(int lastChapterIndex) {
    int? index = nextChapterIndex(lastChapterIndex);
    if (index != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return ChapterPage(slug: widget.slug, index: index);
          },
        ),
      );
    } else {
      Toast.warning(context, "Đã đến chương cuối cùng");
    }
  }

  void onPreviousChapter(int firstChapterIndex) {
    int? index = previousChapterIndex(firstChapterIndex);
    if (index != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return ChapterPage(slug: widget.slug, index: index);
          },
        ),
      );
    } else {
      Toast.warning(context, "Đây là chương đầu tiên");
    }
  }

  Future<Chapter> fetchChapter() async {
    int chapterIndex = widget.index;
    Response res = await ChapterService.getChapter(widget.slug, chapterIndex);
    return Chapter.fromJson(res.data['data']);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: chapterFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          Chapter chapter = snapshot.data!;
          return Consumer<ChapterProvider>(
            builder: (context, value, child) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(chapter.name),
                  backgroundColor: value.color.background,
                  foregroundColor: value.color.foreground,
                  actions: [
                    IconButton(
                        onPressed: () {
                          showChapterConfig(context, chapter: chapter);
                        },
                        icon: const Icon(Icons.settings))
                  ],
                ),
                body: GestureDetector(
                  onTap: () {
                    showChapterConfig(context, chapter: chapter);
                  },
                  child: ChapterReadingMode.scroll == value.readingMode
                      ? ChapterViewVertical(
                          content: chapter.content!,
                          font: value.font,
                          foreground: value.color.foreground,
                          fontSize: value.fontSize,
                          background: value.color.background,
                        )
                      : ChapterViewHorizon(
                          content: chapter.content!,
                        ),
                ),
                floatingActionButton: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      style: AppColor.textBtnBlue,
                      onPressed: () {
                        onPreviousChapter(1);
                      },
                      icon: const Icon(Icons.navigate_before),
                    ),
                    IconButton(
                      style: AppColor.textBtnBlue,
                      onPressed: () {
                        onNextChapter(chapter.story!.chaptersCount!);
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Scaffold(
          appBar: AppBar(),
          body: SizedBox(
            width: double.infinity,
            child: NoDataFromServer(
              onRefresh: () {
                setState(() {
                  chapterFuture = fetchChapter();
                });
              },
            ),
          ),
        );
      },
    );
  }
}
