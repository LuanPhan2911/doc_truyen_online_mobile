import 'package:doc_truyen_online_mobile/data/models/chapter.dart';
import 'package:doc_truyen_online_mobile/helpers/format_date.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class ChapterListDetail extends StatelessWidget {
  final VoidCallback onTap;
  final Chapter chapter;
  final int? index;
  const ChapterListDetail({
    super.key,
    required this.onTap,
    required this.chapter,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${chapter.index}",
              style: AppText.subtitle,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "${chapter.name} (${FormatDate.date.format(chapter.createdAt)})",
                style: index != null && chapter.index == index
                    ? AppText.title
                    : AppText.largeContent,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
