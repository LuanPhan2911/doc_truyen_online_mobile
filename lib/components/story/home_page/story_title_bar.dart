import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class StoryTitleBar extends StatelessWidget {
  final String title;
  final VoidCallback? onShowDetail;
  const StoryTitleBar({super.key, required this.title, this.onShowDetail});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppText.title,
      ),
      trailing: const Icon(Icons.navigate_next),
      onTap: () {
        if (onShowDetail != null) {
          onShowDetail!();
        }
      },
    );
  }
}
