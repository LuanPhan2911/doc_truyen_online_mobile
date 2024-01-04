import 'package:flutter/material.dart';

class CommentForm extends StatelessWidget {
  final bool isChild;
  CommentForm({super.key, this.isChild = false});
  TextEditingController commentMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: commentMessageController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: isChild ? "Thêm trả lời" : "Thêm bình luận",
        prefixIcon: const Icon(Icons.message),
        suffixIcon: IconButton(
          onPressed: () {
            commentMessageController.clear();
            FocusScope.of(context).unfocus();
          },
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }
}
