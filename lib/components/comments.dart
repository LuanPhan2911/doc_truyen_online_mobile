import 'package:doc_truyen_online_mobile/components/comment.dart';
import 'package:doc_truyen_online_mobile/components/comment_form.dart';
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
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  child: Text("Mới nhất"),
                ),
                PopupMenuItem(
                  child: Text("Củ nhất"),
                ),
              ];
            },
          )
        ],
      ),
      bottomSheet: const CommentForm(),
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
