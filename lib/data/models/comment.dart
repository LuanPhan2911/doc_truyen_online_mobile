import 'package:doc_truyen_online_mobile/data/models/user.dart';

class Comment {
  String id;
  String? parentId;
  String message;
  DateTime createdAt;
  User user;
  String repliesCount;
  String commentableId;
  Comment({
    required this.id,
    required this.createdAt,
    required this.message,
    this.parentId,
    required this.repliesCount,
    required this.user,
    required this.commentableId,
  });
  factory Comment.fromJson(Map<String, dynamic> data) {
    return Comment(
      id: data['id'].toString(),
      createdAt: DateTime.parse(data['created_at']),
      message: data['message'],
      repliesCount: data['replies_count'].toString(),
      user: User.fromJson(data['user']),
      commentableId: data['commentable_id'].toString(),
    );
  }
}
