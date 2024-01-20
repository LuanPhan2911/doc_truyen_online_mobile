import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryDescription extends StatelessWidget {
  final String description;
  final String chaptersCount;
  const StoryDescription(
      {super.key, required this.description, required this.chaptersCount});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: AppColor.textBoxBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Text('15', style: AppText.bigTitle),
                    Text("Chương/Tuần", style: AppText.content),
                  ],
                ),
                Column(
                  children: [
                    Text(chaptersCount, style: AppText.bigTitle),
                    const Text("Chương- Đang ra", style: AppText.content),
                  ],
                ),
                const Column(
                  children: [
                    Text('599', style: AppText.bigTitle),
                    Text("Lượt đọc", style: AppText.content),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              description,
              style: AppText.content,
            ),
          )
        ],
      ),
    );
  }
}
