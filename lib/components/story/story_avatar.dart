import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class StoryAvatar extends StatelessWidget {
  final String avatar;
  final VoidCallback? onTap;
  const StoryAvatar({super.key, required this.avatar, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: Helper.asset(avatar),
        ),
      ),
    );
  }
}
