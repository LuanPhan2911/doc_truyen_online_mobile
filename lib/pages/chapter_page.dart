import 'dart:developer';

import 'package:doc_truyen_online_mobile/components/chapter/chapter_config_info.dart';
import 'package:doc_truyen_online_mobile/components/chapter/chapter_config_setting.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class ChapterPage extends StatefulWidget {
  final String slug;
  final String index;
  const ChapterPage({super.key, required this.slug, required this.index});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  void showChapterConfig({required context}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: const DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: TabBar(
                labelPadding: EdgeInsets.all(5),
                tabs: [
                  Tab(
                    child: Text(
                      "Thông tin",
                      style: AppText.subtitle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Cài đặt",
                      style: AppText.subtitle,
                    ),
                  ),
                ],
              ),
              body: TabBarView(
                children: [
                  ChapterConfigInfo(),
                  ChapterConfigSetting(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chuong k32k kska"),
        actions: [
          IconButton(
              onPressed: () {
                showChapterConfig(context: context);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: GestureDetector(
        onTap: () {
          showChapterConfig(context: context);
        },
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
