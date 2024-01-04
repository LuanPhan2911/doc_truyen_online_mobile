import 'package:doc_truyen_online_mobile/components/story/story_favorite.dart';
import 'package:doc_truyen_online_mobile/components/story/story_new_created.dart';
import 'package:doc_truyen_online_mobile/components/story/story_newest.dart';
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
          children: const [
            StoryNewest(),
            StoryFavorite(),
            StoryNewCreated(),
          ],
        ));
  }
}
