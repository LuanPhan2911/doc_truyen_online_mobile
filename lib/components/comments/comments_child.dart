import 'package:doc_truyen_online_mobile/components/comments/comment.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_form.dart';
import 'package:flutter/material.dart';

class CommentsChild extends StatelessWidget {
  static bool isChild = true;
  const CommentsChild({super.key});

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
          Comment(
            isChild: isChild,
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                ...List.generate(100, (index) {
                  return Comment(
                    isChild: isChild,
                  );
                })
              ],
            ),
          )
        ]),
      ),
    );
  }
}
