import 'package:flutter/material.dart';

class CommentForm extends StatelessWidget {
  const CommentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Thêm bình luận",
        prefixIcon: const Icon(Icons.message),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }
}
