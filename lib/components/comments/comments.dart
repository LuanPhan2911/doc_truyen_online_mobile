import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_content.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_form.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
import 'package:doc_truyen_online_mobile/components/layouts/paginator.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/services/comment_service.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  final int storyId;
  final int commentsCount;
  const Comments(
      {super.key, required this.storyId, required this.commentsCount});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  late Future<List<Comment>> comments;
  Comment? newComment;

  @override
  void initState() {
    super.initState();
  }

  void addNewComment(Comment comment) {
    setState(() {
      newComment = comment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.commentsCount} bình luận"),
        centerTitle: true,
      ),
      bottomSheet: CommentForm(
        commentableId: widget.storyId,
        commentableType: "story",
        addComment: addNewComment,
      ),
      body: Paginator(
        fetch: (cursor) => CommentService.getComments(cursor, widget.storyId),
        newItem: newComment?.toMap(),
        builder: (item) {
          return CommentContent(
            isChild: false,
            comment: Comment.fromJson(item),
          );
        },
      ),
    );
  }
}
