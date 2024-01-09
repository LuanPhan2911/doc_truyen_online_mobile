import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class Toast {
  static error(context, message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.red,
        content: Text(
          message,
          style: AppText.subtitle,
        ),
      ),
    );
  }

  static success(context, message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.green,
        content: Text(
          message,
          style: AppText.subtitle,
        ),
      ),
    );
  }

  static warning(context, message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.yellow,
        content: Text(
          message,
          style: AppText.subtitle,
        ),
      ),
    );
  }
}
