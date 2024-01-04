import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryAvatarWithStoryName extends StatelessWidget {
  const StoryAvatarWithStoryName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Column(
        children: [
          StoryAvatar(),
          Text(
            "hello world ",
            style: AppText.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Huyền huyễn",
            style: AppText.smallContent,
          ),
        ],
      ),
    );
  }
}
