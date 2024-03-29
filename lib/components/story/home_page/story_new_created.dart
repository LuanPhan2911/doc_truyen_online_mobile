import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/app/story_filter_provider.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar_with_story_name.dart';
import 'package:doc_truyen_online_mobile/components/story/home_page/story_title_bar.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/services/story_sevice.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryNewCreated extends StatefulWidget {
  const StoryNewCreated({super.key});

  @override
  State<StoryNewCreated> createState() => _StoryNewCreatedState();
}

class _StoryNewCreatedState extends State<StoryNewCreated> {
  late Future<List<Story>> stories;

  Future<List<Story>> fetchStories() async {
    Response res =
        await StoryService.getFilterStories({"sort_by": "newest_created"});
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
          StoryTitleBar(
            title: "Mới đăng",
            onShowDetail: () {
              Provider.of<StoryFilterProvider>(context, listen: false)
                  .changeSelectedSortBy("newest_created");
              Story.showFilterStories(
                context,
              );
            },
          ),
          SizedBox(
            height: 250,
            child: FutureBuilder(
              future: stories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      Story story = snapshot.data![index];
                      return SizedBox(
                        height: 150,
                        width: 120,
                        child: StoryAvatarWithStoryName(
                          story: story,
                          onTap: () {
                            Story.showStoryDetail(context, story.slug);
                          },
                        ),
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
          )
        ],
      ),
    );
  }
}
