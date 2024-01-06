import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryReadingPage extends StatelessWidget {
  const StoryReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tủ truyện"),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          if (!value.isAuth) {
            return Center(
              child: TextButton(
                style: AppColor.textBtnBlue,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoute.login);
                },
                child: const Text(
                  "Vui lòng đăng nhập để lưu truyện đã đọc",
                  style: AppText.subtitle,
                ),
              ),
            );
          } else {
            return Text("data");
          }
        },
      ),
    );
  }
}
