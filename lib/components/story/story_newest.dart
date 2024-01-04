import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/arguments/story_argument.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryNewest extends StatelessWidget {
  const StoryNewest({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              "Mới nhất",
              style: AppText.title,
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.storySearch);
            },
          ),
          SizedBox(
            height: 350,
            width: double.infinity,
            child: DefaultTabController(
              length: 8,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelPadding: const EdgeInsets.all(5),
                    tabs: List.generate(8, (index) {
                      return Container(
                          padding: EdgeInsets.zero,
                          width: 60,
                          height: 80,
                          child: const StoryAvatar());
                    }).toList(),
                  ),
                ),
                body: TabBarView(
                  children: List.generate(
                    8,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Huyền huyễn",
                                      style: AppText.subtitle),
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
                                  const Text(
                                    "Tindjad jfka dkdjad adkandka ạkadkadk jadjakd ",
                                    style: AppText.content,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      width: 150,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                            AppRoute.storyDetail,
                                            arguments: StoryArgument(
                                              slug: "abc",
                                            ),
                                          );
                                        },
                                        style: AppColor.textBtnBlack,
                                        child: const Text(
                                          "Đọc",
                                          style: AppText.subtitle,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoute.storyDetail,
                                  arguments: StoryArgument(
                                    slug: "abc",
                                  ),
                                );
                              },
                              child: const StoryAvatar(),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
