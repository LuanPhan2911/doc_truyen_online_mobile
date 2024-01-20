import 'package:doc_truyen_online_mobile/components/story/story_avatar.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StorySearchItem extends StatelessWidget {
  final Story story;
  const StorySearchItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 130,
            child: StoryAvatar(
              avatar: story.avatar!,
              onTap: () {
                Story.showStoryDetail(context, story.slug);
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
                RichText(
                  text: TextSpan(
                    style: AppText.contentBlue,
                    children: <TextSpan>[
                      TextSpan(text: "#${story.genre!.name!}"),
                      TextSpan(text: "#${story.author!.name!}"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Story.showStoryDetail(context, story.slug);
                  },
                  child: Text(
                    story.name,
                    style: AppText.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  story.author!.name!,
                  style: AppText.content,
                ),
                RichText(
                    text: TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.star,
                  )),
                  const TextSpan(text: "0.0", style: AppText.subtitle),
                  const WidgetSpan(
                      child: Icon(
                    Icons.book,
                  )),
                  TextSpan(
                      text: "${story.chaptersCount!}", style: AppText.subtitle),
                ]))
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
