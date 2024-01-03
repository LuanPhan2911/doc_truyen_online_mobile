import 'dart:ui';

import 'package:doc_truyen_online_mobile/components/chapter_list.dart';
import 'package:doc_truyen_online_mobile/components/comments.dart';
import 'package:doc_truyen_online_mobile/components/story_description.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/arguments/chapter_argument.dart';
import 'package:doc_truyen_online_mobile/data/arguments/story_argument.dart';
import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments as StoryArgument;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const Expanded(
              flex: 3,
              child: Text(
                "Teen truwyenw",
                style: TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoute.chapter,
                    arguments: ChapterArgument(
                      slug: "abc",
                      index: 1,
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                child: const Text("Đọc"),
              ),
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://imgupscaler.com/images/samples/anime-after.webp",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://imgupscaler.com/images/samples/anime-after.webp",
                              )),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text(
                                    "Huyền huyễn",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "hello world ajn adandad nadkand andka",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                            AppRoute.chapter,
                                            arguments: ChapterArgument(
                                              slug: "abc",
                                              index: 1,
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            foregroundColor: Colors.white),
                                        child: const Text("Đọc"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        style: IconButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.white),
                                        onPressed: () {},
                                        icon: const Icon(Icons.add_outlined))
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: const TabBar(
                    labelPadding: EdgeInsets.all(5),
                    tabs: [
                      Tab(
                        child: Text("Giới thiệu"),
                      ),
                      Tab(
                        child: Text("Bình luận"),
                      ),
                      Tab(
                        child: Text("DS. Chương"),
                      ),
                    ],
                  ),
                  body: TabBarView(
                    children: [
                      const StoryDescription(),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoute.comment);
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Nhấn vào đây để bình luận",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const ChapterList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
