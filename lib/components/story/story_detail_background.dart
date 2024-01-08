import 'dart:ui';

import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';

class StoryDetailBackground extends StatelessWidget {
  final String avatar;
  final Widget child;
  const StoryDetailBackground(
      {super.key, required this.child, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            Helper.asset(avatar),
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColor.dart.withOpacity(0.5),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
