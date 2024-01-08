import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryDescription extends StatelessWidget {
  final String description;
  const StoryDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: AppColor.textBoxBlack,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('15', style: AppText.bigTitle),
                    Text("Chương/Tuần", style: AppText.content),
                  ],
                ),
                Column(
                  children: [
                    Text('599', style: AppText.bigTitle),
                    Text("Chương- Đang ra", style: AppText.content),
                  ],
                ),
                Column(
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
