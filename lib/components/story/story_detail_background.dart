import 'dart:ui';

import 'package:flutter/material.dart';

class StoryDetailBackground extends StatelessWidget {
  final Widget child;
  const StoryDetailBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://imgupscaler.com/images/samples/anime-after.webp",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
