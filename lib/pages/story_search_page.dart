import 'dart:async';

import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/arguments/story_argument.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StorySearchPage extends StatefulWidget {
  const StorySearchPage({
    super.key,
  });

  @override
  State<StorySearchPage> createState() => _StorySearchPageState();
}

class _StorySearchPageState extends State<StorySearchPage> {
  bool isSearch = false;
  bool isLoading = false;
  final TextEditingController searchController =
      TextEditingController(text: "");
  final ScrollController scrollController = ScrollController();
  List item = List.generate(10, (index) => index);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(handleSearch);
    scrollController.addListener(loadMore);
  }

  void handleSearch() {}

  void loadMore() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      try {
        isLoading = true;
        await getStories();
      } catch (e) {
        print(e);
      } finally {
        isLoading = false;
      }
      setState(() {});
    }
  }

  Future getStories() {
    return Future.delayed(const Duration(seconds: 2), () {
      item.addAll(List.generate(2, (index) => index));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: isSearch
              ? TextField(
                  controller: searchController,
                  // autofocus: true,
                )
              : const Text("DS. Truyện"),
          actions: [
            IconButton(
                onPressed: () {
                  if (isSearch) {
                    searchController.clear();
                    setState(() {
                      isSearch = false;
                    });
                  } else {
                    setState(() {
                      isSearch = true;
                    });
                  }
                },
                icon: isSearch
                    ? const Icon(Icons.clear)
                    : const Icon(Icons.search))
          ],
        ),
        body: ListView(
          controller: scrollController,
          children: [
            ...List.generate(item.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
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
                          width: 100,
                          height: 120,
                          // child: const StoryAvatar(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              style: AppText.contentBlue,
                              children: <TextSpan>[
                                TextSpan(text: "#Đô thị"),
                                TextSpan(text: "#Tác giả"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                            child: Text(
                              "Tên truyện $index",
                              style: AppText.subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Tên tác giả',
                            style: AppText.content,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.star,
                            )),
                            TextSpan(text: "0.0", style: AppText.content),
                            WidgetSpan(
                                child: Icon(
                              Icons.book,
                            )),
                            TextSpan(text: "512", style: AppText.content),
                          ]))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            const Center(
              child: CircularProgressIndicator(),
            )
          ],
        ));
  }
}
