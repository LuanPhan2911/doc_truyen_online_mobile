import 'package:doc_truyen_online_mobile/data/models/story.dart';

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
  factory Chapter.fromJson(Map<String, dynamic> data) {
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
}
