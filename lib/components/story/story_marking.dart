import 'package:doc_truyen_online_mobile/components/story/story_reading_item.dart';
import 'package:flutter/material.dart';

class StoryMarking extends StatelessWidget {
  const StoryMarking({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemBuilder: (context, index) {
        return Container();
      },
    );
    ;
  }
}
