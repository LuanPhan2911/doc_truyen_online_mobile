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
class StoryMarkingItem extends StatefulWidget {
  final Story story;
  Function(Story? story)? deleteStory;
  StoryMarkingItem({
    super.key,
    required this.story,
    this.deleteStory,
  });

  @override
  State<StoryMarkingItem> createState() => _StoryReadingItemState();
}

class _StoryReadingItemState extends State<StoryMarkingItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> deleteStoryMarking(Story story) async {
    Response res = await UserService.deleteStoryMarking(story.id!);
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 70,
            child: StoryAvatar(
              radius: 5,
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
                storyUser.index != 0
                    ? Text(
                        "Đã đánh dấu ${storyUser.index}/${widget.story.chaptersCount}",
                        style: AppText.content,
                      )
                    : const Text("-------------"),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              deleteStoryMarking(widget.story);
            },
            icon: const Icon(
              Icons.delete,
              color: AppColor.red,
            ),
          ),
        ],
      ),
    );
  }
}
