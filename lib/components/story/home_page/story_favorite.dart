import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/app/story_filter_provider.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar_with_story_name.dart';
import 'package:doc_truyen_online_mobile/components/story/home_page/story_title_bar.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/services/story_sevice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryFavorite extends StatefulWidget {
  const StoryFavorite({super.key});

  @override
  State<StoryFavorite> createState() => _StoryFavoriteState();
}

class _StoryFavoriteState extends State<StoryFavorite> {
  late Future<List<Story>> stories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stories = fetchStories();
  }

  Future<List<Story>> fetchStories() async {
    Response res = await StoryService.getFilterStories({"sort_by": "favorite"});
    return List.from(res.data['data']).map((e) => Story.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          StoryTitleBar(
            title: "Đề cử",
            onShowDetail: () {
              Provider.of<StoryFilterProvider>(context, listen: false)
                  .changeSelectedSortBy("favorite");
              Story.showFilterStories(
                context,
              );
            },
          ),
          SizedBox(
            height: 600,
            child: FutureBuilder(
              future: stories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, mainAxisExtent: 300),
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
          )
        ],
      ),
    );
  }
}
