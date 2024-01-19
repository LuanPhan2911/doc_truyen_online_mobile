import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/chapter/chapter_list_detail.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/data/models/chapter.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/pages/chapter_page.dart';
import 'package:doc_truyen_online_mobile/services/chapter_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class ChapterList extends StatefulWidget {
  final String slug;
  const ChapterList({super.key, required this.slug});

  @override
  State<ChapterList> createState() => _ChapterListState();
}

class _ChapterListState extends State<ChapterList> {
  late Future<List<Chapter>> chapterList;
  bool isSort = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chapterList = fetchChapterList(widget.slug);
  }

  Future<List<Chapter>> fetchChapterList(String slug) async {
    Response res = await ChapterService.getChapterList(slug);
    return List.from(res.data['data']).map((e) => Chapter.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: chapterList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          List<Chapter> chapters = snapshot.data!;
          if (isSort) {
            chapters = chapters.reversed.toList();
          }
          if (chapters.isEmpty) {
            return const Center(
              child: Text(
                "Truyện không có chương mới",
                style: AppText.title,
              ),
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Số chương: ${chapters.length}",
                      style: AppText.subtitle),
                  IconButton(
                    style: AppColor.iconBtnBlue,
                    onPressed: () {
                      setState(() {
                        isSort = !isSort;
                      });
                    },
                    icon: const Icon(Icons.sort),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...List.generate(
                      chapters.length,
                      (index) {
                        Chapter chapter = chapters[index];
                        return ChapterListDetail(
                          onTap: () {
                            Chapter.showChapter(context,
                                slug: widget.slug, index: chapter.index);
                          },
                          chapter: chapter,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return NoDataFromServer(
          onRefresh: () {
            setState(() {
              chapterList = fetchChapterList(widget.slug);
            });
          },
        );
      },
    );
  }
}
