import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/pages/chapter_list_page.dart';
import 'package:doc_truyen_online_mobile/pages/chapter_page.dart';
import 'package:flutter/material.dart';

class Chapter {
  int id;
  String name;
  int index;
  String? content;
  DateTime createdAt;
  int? storyId;
  Story? story;
  Chapter(
      {required this.id,
      required this.name,
      required this.index,
      this.content,
      required this.createdAt,
      this.storyId,
      required this.story});
  factory Chapter.fromJson(Map data) {
    return Chapter(
      id: data['id'],
      name: data['name'],
      index: data['index'],
      content: data['content'] ?? "",
      createdAt: DateTime.parse(data['created_at']),
      storyId: data['story_id'],
      story: data['story'] != null ? Story.fromJson(data['story']) : null,
    );
  }
  static void showChapter(context, {required String slug, required int index}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ChapterPage(
          slug: slug,
          index: index,
        );
      },
    ));
  }

  static void showChapterList(context,
      {required String slug, required int index}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return ChapterListPage(
            slug: slug,
            index: index,
          );
        },
      ),
    );
  }
}
