import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  const StoryAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        "https://imgupscaler.com/images/samples/anime-after.webp",
      ),
    );
  }
}
