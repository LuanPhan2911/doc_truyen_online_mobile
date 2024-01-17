import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class StoryAvatar extends StatelessWidget {
  final String avatar;

  final VoidCallback? onTap;
  const StoryAvatar({
    super.key,
    required this.avatar,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
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
