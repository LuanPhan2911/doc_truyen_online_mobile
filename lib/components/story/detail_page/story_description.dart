import 'package:doc_truyen_online_mobile/data/models/genre.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryDescription extends StatelessWidget {
  final String description;
  final String chaptersCount;
  final List<Genre> genres;
  const StoryDescription({
    super.key,
    required this.description,
    required this.chaptersCount,
    required this.genres,
  });

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 10,
              children: genres
                  .map(
                    (e) => Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(4),
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.blue,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        e.name!,
                        style: AppText.content,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                  .toList(),
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
