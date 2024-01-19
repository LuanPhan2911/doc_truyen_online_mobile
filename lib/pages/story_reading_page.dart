import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/components/story/story_marking.dart';
import 'package:doc_truyen_online_mobile/components/story/story_reading.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/models/user.dart';
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
            if (value.isAuth) {
              return const Column(
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: TabBar(
                          tabs: [
                            Tab(
                              child: Text(
                                "Lịch sử",
                                style: AppText.subtitle,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Đánh dấu",
                                style: AppText.subtitle,
                              ),
                            ),
                          ],
                        ),
                        body: TabBarView(
                          children: [
                            StoryReading(),
                            StoryMarking(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Cần đăng nhập để lưu lịch sử đọc truyện',
                    style: AppText.subtitle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    child: TextButton(
                        style: AppColor.textBtnBlue,
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoute.login);
                        },
                        child: const Text("Đăng nhập")),
                  )
                ],
              ),
            );
          },
        ));
  }
}
