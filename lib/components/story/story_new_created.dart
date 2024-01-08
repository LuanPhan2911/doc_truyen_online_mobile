import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar_with_story_name.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/arguments/story_argument.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/services/story_sevice.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryNewCreated extends StatefulWidget {
  const StoryNewCreated({super.key});

  @override
  State<StoryNewCreated> createState() => _StoryNewCreatedState();
}

class _StoryNewCreatedState extends State<StoryNewCreated> {
  late Future<List<Story>> stories;

  Future<List<Story>> fetchStories() async {
    Response res = await StoryService.getStories();
    return List.from(res.data['data']).map((e) => Story.fromJson(e)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stories = fetchStories();
  }

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
              child: FutureBuilder(
                future: stories,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 100,
                      ),
                      primary: false,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        Story story = snapshot.data![index];
                        return GestureDetector(
                            onTap: () {
                              Story.showStoryDetail(context, story.slug);
                            },
                            child: StoryAvatarWithStoryName(
                              story: story,
                            ));
                      },
                    );
                  }
                  return Text("None data");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
