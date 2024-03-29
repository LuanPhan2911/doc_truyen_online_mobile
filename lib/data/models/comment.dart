import 'package:doc_truyen_online_mobile/components/comments/comments.dart';
import 'package:doc_truyen_online_mobile/components/comments/comments_child.dart';
import 'package:doc_truyen_online_mobile/data/models/user.dart';
import 'package:flutter/material.dart';

class Comment {
  int? id;
  int? parentId;
  String message;
  DateTime createdAt;
  User? user;
  int? repliesCount;
  int? commentableId;
  int likeCount = 0;
  Comment(
      {required this.id,
      required this.createdAt,
      required this.message,
      this.parentId,
      required this.repliesCount,
      required this.user,
      required this.commentableId,
      required this.likeCount});
  factory Comment.fromJson(Map data) {
    return Comment(
      id: data['id'],
      createdAt: DateTime.parse(data['created_at']),
      message: data['message'],
      repliesCount: data['replies_count'],
      user: User.fromJson(data['user']),
      commentableId: data['commentable_id'],
      likeCount:
          data['like_counter'] != null ? data['like_counter']['count'] : 0,
    );
  }
  Map toMap() {
    return {
      "id": id,
      "parentId": parentId,
      "message": message,
      "created_at": createdAt.toString(),
      "replies_count": repliesCount,
      "user": user?.toMap(),
      "commentable_id": commentableId,
      "like_counter": {'count': likeCount}
    };
  }

  static void showComments(context,
      {required int storyId, required int commentCount}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return Comments(storyId: storyId, commentsCount: commentCount);
      },
    ));
  }

  static void showReplies(context, {required Comment commentParent}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return CommentsChild(
          commentParent: commentParent,
        );
      },
    ));
  }
}
