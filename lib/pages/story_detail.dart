import 'dart:ui';

import 'package:doc_truyen_online_mobile/components/chapter/chapter_list.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/components/story/story_description.dart';
import 'package:doc_truyen_online_mobile/components/story/story_detail_background.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/arguments/chapter_argument.dart';
import 'package:doc_truyen_online_mobile/data/arguments/story_argument.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
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
      body: Column(
        children: [
          StoryDetailBackground(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const StoryAvatar(),
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
                          decoration: AppColor.textBoxBlue,
                          child: const Text(
                            "Huyền huyễn",
                            style: AppText.subtitle,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "hello world ajn adandad nadkand andka",
                          style: AppText.title,
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
                                style: AppColor.textBtnBlack,
                                child: const Text("Đọc"),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              style: AppColor.iconBtnBlue,
                              onPressed: () {},
                              icon: const Icon(Icons.add_outlined),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: const TabBar(
                  tabs: [
                    Tab(
                      child: Text("Giới thiệu", style: AppText.subtitle),
                    ),
                    Tab(
                      child: Text("Bình luận", style: AppText.subtitle),
                    ),
                    Tab(
                      child: Text("DS. Chương", style: AppText.subtitle),
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
                        style: AppColor.textBtnBlue,
                        child: const Text(
                          "Nhấn vào đây để bình luận",
                          style: AppText.subtitle,
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
    );
  }
}
