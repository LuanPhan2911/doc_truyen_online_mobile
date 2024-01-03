import 'package:doc_truyen_online_mobile/components/comment.dart';
import 'package:flutter/material.dart';

class CommentsChild extends StatelessWidget {
  const CommentsChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết bình luận"),
      ),
      bottomSheet: TextField(
        decoration: InputDecoration(
          hintText: "Thêm bình luận",
          prefixIcon: const Icon(Icons.message),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          const Comment(),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: 500,
            child: ListView(
              children: [
                ...List.generate(100, (index) {
                  return const Comment();
                })
              ],
            ),
          )
        ]),
      ),
    );
  }
}
