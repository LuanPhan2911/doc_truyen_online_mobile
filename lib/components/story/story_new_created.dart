import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar_with_story_name.dart';
import 'package:doc_truyen_online_mobile/components/story/story_title_bar.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/services/story_sevice.dart';

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
          const StoryTitleBar(title: "Mới đăng"),
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
                        return StoryAvatarWithStoryName(
                          story: story,
                          onTap: () {
                            Story.showStoryDetail(context, story.slug);
                          },
                        );
                      },
                    );
                  }
                  return NoDataFromServer(
                    onRefresh: () {
                      setState(() {
                        stories = fetchStories();
                      });
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
