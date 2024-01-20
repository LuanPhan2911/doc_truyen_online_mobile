import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryNewestDetail extends StatelessWidget {
  final Story story;
  const StoryNewestDetail({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(story.genre!.name!, style: AppText.subtitle),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  story.name,
                  style: AppText.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  story.truncateDescription ?? "",
                  style: AppText.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: TextButton(
                      onPressed: () {
                        Story.showStoryDetail(context, story.slug);
                      },
                      style: AppColor.textBtnBlack,
                      child: const Text(
                        "Đọc",
                        style: AppText.subtitle,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          StoryAvatar(
            avatar: story.avatar!,
            onTap: () {
              Story.showStoryDetail(context, story.slug);
            },
          ),
        ],
      ),
    );
    ;
  }
}
