import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/components/story/story_newest_detail.dart';
import 'package:doc_truyen_online_mobile/components/story/story_title_bar.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/services/story_sevice.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

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
    Response res = await StoryService.getStories();
    return List.from(res.data['data']).map((e) => Story.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const StoryTitleBar(title: "Mới nhất"),
          SizedBox(
            height: 350,
            width: double.infinity,
            child: FutureBuilder(
              future: stories,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
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
                            return Container(
                              padding: EdgeInsets.zero,
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
