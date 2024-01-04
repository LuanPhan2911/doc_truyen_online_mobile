import 'package:doc_truyen_online_mobile/components/comments/comment.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_form.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("127182 bình luận"),
        centerTitle: true,
      ),
      bottomSheet: CommentForm(),
      body: ListView(
        children: [
          ...List.generate(100, (index) {
            return const Comment();
          })
        ],
      ),
    );
  }
}
