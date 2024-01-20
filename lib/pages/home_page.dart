import 'package:doc_truyen_online_mobile/components/story/home_page/story_favorite.dart';
import 'package:doc_truyen_online_mobile/components/story/home_page/story_new_created.dart';
import 'package:doc_truyen_online_mobile/components/story/home_page/story_newest.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: SearchBar(
            leading: const Icon(Icons.search),
            trailing: [
              IconButton(
                onPressed: () {
                  searchController.clear();
                },
                icon: const Icon(
                  Icons.clear,
                ),
              )
            ],
            controller: searchController,
            hintText: "Tên truyện...",
            onSubmitted: (value) {
              if (value.isNotEmpty && value.length > 1) {
                Story.showFilterStories(context, name: value);
              }
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Story.showFilterStories(
                    context,
                  );
                },
                icon: const Icon(Icons.filter_alt))
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              StoryNewest(),
              StoryFavorite(),
              StoryNewCreated(),
            ],
          ),
        ));
  }
}
