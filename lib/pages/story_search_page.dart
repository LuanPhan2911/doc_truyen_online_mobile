import 'dart:async';

import 'package:flutter/material.dart';

class StorySearchPage extends StatefulWidget {
  const StorySearchPage({super.key});

  @override
  State<StorySearchPage> createState() => _StorySearchPageState();
}

class _StorySearchPageState extends State<StorySearchPage> {
  bool isSearch = true;
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

  void handleSearch() {
    Future.delayed(Duration(milliseconds: 500), () {
      print(searchController.text);
    });
  }

  void loadMore() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        Timer(Duration(milliseconds: 2000), () {
          item.addAll(List.generate(10, (index) => index));
        });
      });
    }
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
        body: ListView.separated(
          controller: scrollController,
          itemCount: item.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100,
                      height: 120,
                      padding: EdgeInsets.zero,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          "https://imgupscaler.com/images/samples/anime-after.webp",
                        ),
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
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                            children: <TextSpan>[
                              TextSpan(text: "#Đô thị"),
                              TextSpan(text: "#Tác giả"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Tên truyện",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Tên tác giả',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: const TextSpan(children: [
                          WidgetSpan(
                              child: Icon(
                            Icons.star,
                            size: 16,
                          )),
                          TextSpan(text: "0.0"),
                          TextSpan(text: "  "),
                          WidgetSpan(
                              child: Icon(
                            Icons.book,
                            size: 16,
                          )),
                          TextSpan(text: "512"),
                        ]))
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
