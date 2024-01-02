import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/arguments/story_argument.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DS. Truyện"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoute.storySearch);
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "Mới nhất",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
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
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        AppRoute.storyDetail,
                                        arguments: StoryArgument(
                                          slug: "abc",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      width: 60,
                                      height: 80,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          "https://imgupscaler.com/images/samples/anime-after.webp",
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            body: TabBarView(
                              children: List.generate(8, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Huyền huyễn",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.italic),
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
                                            const Text(
                                              "Tindjad jfka dkdjad adkandka ạkadkadk jadjakd ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                    AppRoute.storyDetail,
                                                    arguments: StoryArgument(
                                                      slug: "abc",
                                                    ),
                                                  );
                                                },
                                                style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black,
                                                    foregroundColor:
                                                        Colors.white),
                                                child: const Text("Đọc"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              AppRoute.storyDetail,
                                              arguments: StoryArgument(
                                                slug: "abc",
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.network(
                                                  "https://imgupscaler.com/images/samples/anime-after.webp",
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          )))
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "Đề cử",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoute.storySearch);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 240,
                        ),
                        primary: false,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoute.storyDetail,
                                arguments: StoryArgument(
                                  slug: "abc",
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "https://imgupscaler.com/images/samples/anime-after.webp",
                                    ),
                                  ),
                                  const Text(
                                    "hello world ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Text(
                                    "Huyền huyễn",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "Mới đăng",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: const Icon(Icons.navigate_next),
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoute.storySearch);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 100,
                        ),
                        primary: false,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoute.storyDetail,
                                arguments: StoryArgument(
                                  slug: "abc",
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "https://imgupscaler.com/images/samples/anime-after.webp",
                                    ),
                                  ),
                                  const Text(
                                    "hello world ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Text(
                                    "Huyền huyễn",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
