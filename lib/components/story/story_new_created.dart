import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar_with_story_name.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/arguments/story_argument.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryNewCreated extends StatelessWidget {
  const StoryNewCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text("Mới đăng", style: AppText.title),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      child: const StoryAvatarWithStoryName());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
