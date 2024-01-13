import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/chapter/chapter_list_detail.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/data/models/chapter.dart';
import 'package:doc_truyen_online_mobile/pages/chapter_page.dart';
import 'package:doc_truyen_online_mobile/services/chapter_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class ChapterListPage extends StatefulWidget {
  final String slug;
  final int index;
  const ChapterListPage({
    super.key,
    required this.slug,
    required this.index,
  });

  @override
  State<ChapterListPage> createState() => _ChapterListPageState();
}

class _ChapterListPageState extends State<ChapterListPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DS. Chương",
          style: AppText.title,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: chapterList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                Expanded(
                  child: ListView(
                    children: [
                      ...chapters
                          .map((chapter) => ChapterListDetail(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) {
                                    return ChapterPage(
                                      slug: widget.slug,
                                      index: chapter.index,
                                    );
                                  },
                                ));
                              },
                              chapter: chapter,
                              index: widget.index))
                          .toList(),
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
            onRefresh: () {},
          );
        },
      ),
    );
  }
}
