import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class StoryAvatar extends StatelessWidget {
  final String avatar;
  const StoryAvatar({super.key, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: Helper.asset(avatar),
        ));
  }
}
