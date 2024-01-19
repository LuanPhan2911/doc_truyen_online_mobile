import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/chapter/chapter_list.dart';
import 'package:doc_truyen_online_mobile/components/comments/comments.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/components/story/story_description.dart';
import 'package:doc_truyen_online_mobile/components/story/story_detail_background.dart';
import 'package:doc_truyen_online_mobile/data/models/chapter.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/pages/chapter_page.dart';
import 'package:doc_truyen_online_mobile/services/story_sevice.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryDetail extends StatefulWidget {
  final String slug;
  const StoryDetail({
    super.key,
    required this.slug,
  });

  @override
  State<StoryDetail> createState() => _StoryDetailState();
}

class _StoryDetailState extends State<StoryDetail> {
  late Future<Story> story;

  Future<Story> fetchStory(String slug) async {
    Response res = await StoryService.getStory(slug);
    return Story.fromJson(res.data['data']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    story = fetchStory(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: story,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            Story storyDetail = snapshot.data!;

            return Column(
              children: [
                StoryDetailBackground(
                  avatar: storyDetail.avatar!,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: StoryAvatar(avatar: storyDetail.avatar!),
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
                                child: Text(
                                  storyDetail.genre!.name!,
                                  style: AppText.subtitle,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                storyDetail.name,
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
                                        Chapter.showChapter(
                                          context,
                                          slug: storyDetail.slug,
                                          index: storyDetail.chapterIndex,
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
                          StoryDescription(
                            description: storyDetail.description ?? "",
                            chaptersCount: "${storyDetail.chaptersCount ?? 0}",
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Comment.showComments(
                                  context,
                                  storyId: storyDetail.id!,
                                  commentCount: storyDetail.commentsCount!,
                                );
                              },
                              style: AppColor.textBtnBlue,
                              child: const Text(
                                "Xem bình luận",
                                style: AppText.subtitle,
                              ),
                            ),
                          ),
                          ChapterList(
                            slug: storyDetail.slug,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const NoDataFromServer();
        },
      ),
    );
  }
}
