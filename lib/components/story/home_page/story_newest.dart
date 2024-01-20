import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/app/story_filter_provider.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/components/story/home_page/story_newest_detail.dart';
import 'package:doc_truyen_online_mobile/components/story/home_page/story_title_bar.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/services/story_sevice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryNewest extends StatefulWidget {
  const StoryNewest({super.key});

  @override
  State<StoryNewest> createState() => _StoryNewestState();
}

class _StoryNewestState extends State<StoryNewest> {
  late Future<List<Story>> stories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stories = fetchStories();
  }

  Future<List<Story>> fetchStories() async {
    Response res =
        await StoryService.getFilterStories({"sort_by": "newest_updated"});
    return List.from(res.data['data']).map((e) => Story.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          StoryTitleBar(
            title: "Mới nhất",
            onShowDetail: () {
              Provider.of<StoryFilterProvider>(context, listen: false)
                  .changeSelectedSortBy("newest_updated");

              Story.showFilterStories(
                context,
              );
            },
          ),
          SizedBox(
            height: 350,
            child: FutureBuilder(
              future: stories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return DefaultTabController(
                    length: snapshot.data!.length,
                    child: Scaffold(
                      appBar: AppBar(
                        bottom: TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          labelPadding: const EdgeInsets.all(5),
                          tabs: List.generate(snapshot.data!.length, (index) {
                            Story story = snapshot.data![index];
                            return SizedBox(
                              width: 60,
                              height: 80,
                              child: StoryAvatar(
                                avatar: story.avatar!,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      body: TabBarView(
                        children: snapshot.data!.map(
                          (e) {
                            return StoryNewestDetail(
                              story: e,
                            );
                          },
                        ).toList(),
                      ),
                    ),
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
