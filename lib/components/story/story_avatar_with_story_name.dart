import 'dart:math';

import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryAvatarWithStoryName extends StatelessWidget {
  final Story story;
  const StoryAvatarWithStoryName({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StoryAvatar(avatar: story.avatar),
          Text(
            story.name,
            style: AppText.contentBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            story.genre.name,
            style: AppText.smallContent,
          ),
        ],
      ),
    );
  }
}
