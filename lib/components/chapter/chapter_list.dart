import 'package:dio/dio.dart';
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ChapterPage(
                                  slug: widget.slug,
                                  index: chapters[index].index,
                                );
                              },
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${index + 1}",
                                  style: AppText.subtitle,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        chapters[index].name,
                                        style: AppText.subtitle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        "${chapters[index].createdAt}",
                                        style: AppText.content,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
        return const Text('None data');
      },
    );
  }
}
