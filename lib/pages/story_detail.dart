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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
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
                          const Text(
                            "Huyền huyễn",
                            style: TextStyle(
                                backgroundColor: Colors.blue, fontSize: 16),
                          ),
                          const Text(
                            "hello world ajn adandad nadkand andka",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 100,
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
                          )
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(
              width: double.infinity,
              height: 500,
              child: DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: TabBar(
                    labelPadding: EdgeInsets.all(5),
                    tabs: [
                      Tab(
                        child: Text("Giới thiệu"),
                      ),
                      Tab(
                        child: Text("Đánh giá"),
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
                      Text("gioi thiey"),
                      Text("Danh gia"),
                      Text("Binh luan"),
                      Text("DS ching"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
