import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_content.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_form.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/services/comment_service.dart';
import 'package:flutter/material.dart';

class CommentsChild extends StatefulWidget {
  final Comment commentParent;
  const CommentsChild({super.key, required this.commentParent});

  @override
  State<CommentsChild> createState() => _CommentsChildState();
}

class _CommentsChildState extends State<CommentsChild> {
  late Future<List<Comment>> commentReplies;
  @override
  void initState() {
    super.initState();
    commentReplies = fetchCommentReplies(widget.commentParent.id);
  }

  Future<List<Comment>> fetchCommentReplies(String commentId) async {
    Response res = await CommentService.getCommentReplies(commentId);
    return List.from(res.data['data']).map((e) => Comment.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết bình luận"),
      ),
      bottomSheet: CommentForm(
        isChild: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          CommentContent(
            isChild: true,
            comment: widget.commentParent,
          ),
          const Divider(),
          FutureBuilder(
            future: commentReplies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Comment> comments = snapshot.data!;
                if (comments.isEmpty) {
                  return const Center(
                    child: Text("Không có trả lời"),
                  );
                }
                return Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(comments.length, (index) {
                        return CommentContent(
                            comment: comments[index], isChild: true);
                      })
                    ],
                  ),
                );
              }
              return const Text("None data");
            },
          )
        ]),
      ),
    );
  }
}
