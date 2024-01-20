import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final String avatar;
  final double radius;
  final VoidCallback? onTap;
  const StoryAvatar({
    super.key,
    required this.avatar,
    this.onTap,
    this.radius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: Helper.asset(avatar),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
