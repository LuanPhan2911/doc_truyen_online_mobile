import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/data/models/story_user.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/services/user_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StoryReadingItem extends StatefulWidget {
  final Story story;
  Function(Story? story)? deleteStory;
  StoryReadingItem({
    super.key,
    required this.story,
    this.deleteStory,
  });

  @override
  State<StoryReadingItem> createState() => _StoryReadingItemState();
}

class _StoryReadingItemState extends State<StoryReadingItem> {
  late int isNotified;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isNotified = widget.story.storyUser!.notified!;
  }

  Future<void> updateStoryNotifies(int storyId) async {
    Response res = await UserService.updateHistoryReadingNotifies(storyId);
    if (res.statusCode == 200) {
      int value = res.data['data']['action'];
      setState(() {
        isNotified = value;
      });
    }
  }

  Future<void> deleteStoryReading(Story story) async {
    Response res = await UserService.deleteHistoryReading(story.id!);
    if (res.statusCode == 200) {
      widget.deleteStory!(story);
    }
  }

  @override
  Widget build(BuildContext context) {
    StoryUser storyUser = widget.story.storyUser!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            height: 100,
            child: StoryAvatar(
              avatar: widget.story.avatar!,
              onTap: () {
                Story.showStoryDetail(context, widget.story.slug);
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Story.showStoryDetail(context, widget.story.slug);
                  },
                  child: Text(
                    widget.story.name,
                    style: AppText.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "Đã đọc ${storyUser.index}/${widget.story.chaptersCount}",
                  style: AppText.content,
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () async {
              updateStoryNotifies(widget.story.id!);
            },
            icon: isNotified == 0
                ? const Icon(Icons.notifications_off)
                : const Icon(
                    Icons.notifications,
                    color: AppColor.green,
                  ),
          ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: ListTile(
                  title: Text("Xóa khỏi tủ truyện"),
                  leading: Icon(Icons.delete),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: ListTile(
                  title: isNotified == 0
                      ? const Text("Nhận thông báo")
                      : const Text("Tắt thông báo"),
                  leading: const Icon(Icons.notifications),
                ),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              deleteStoryReading(widget.story);
            } else if (value == 1) {
              updateStoryNotifies(widget.story.id!);
            }
          }),
        ],
      ),
    );
  }
}
