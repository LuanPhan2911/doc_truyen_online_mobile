import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_content.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_form.dart';
import 'package:doc_truyen_online_mobile/components/layouts/no_data_from_server.dart';
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
  bool hasNewComment = false;
  @override
  void initState() {
    super.initState();
    comments = fetchComments(widget.storyId);
  }

  Future<List<Comment>> fetchComments(int storyId) async {
    Response res = await CommentService.getComments(storyId);
    return List.from(res.data['data']['data'])
        .map((e) => Comment.fromJson(e))
        .toList();
  }

  void addNewComment(Comment comment) {
    setState(() {
      hasNewComment = true;
      newComment = comment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          List<Comment> commentList = snapshot.data!;
          if (hasNewComment) {
            commentList.insert(0, newComment!);
          }
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
            body: ListView(
              children: [
                ...List.generate(commentList.length, (index) {
                  return CommentContent(
                    isChild: false,
                    comment: commentList[index],
                  );
                }),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text("Bình luận"),
              centerTitle: true,
            ),
            bottomSheet: CommentForm(
              commentableType: "story",
              commentableId: widget.storyId,
              addComment: addNewComment,
            ),
            body: Center(
              child: NoDataFromServer(
                onRefresh: () {
                  setState(() {
                    comments = fetchComments(widget.storyId);
                  });
                },
              ),
            ));
      },
      future: comments,
    );
  }
}
