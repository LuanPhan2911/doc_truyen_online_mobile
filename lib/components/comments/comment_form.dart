import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/helpers/toast.dart';
import 'package:doc_truyen_online_mobile/services/comment_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentForm extends StatefulWidget {
  final bool isChild;
  final String commentableId;
  final String commentableType;
  final String? parentId;
  final void Function(Comment) addComment;
  const CommentForm({
    super.key,
    this.isChild = false,
    required this.commentableId,
    required this.commentableType,
    this.parentId,
    required this.addComment,
  });

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  TextEditingController commentMessageController = TextEditingController();
  FocusNode focusCreateComment = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusCreateComment.addListener(_onFocusComment);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusCreateComment.removeListener(_onFocusComment);
    focusCreateComment.dispose();
  }

  void _onFocusComment() {
    if (focusCreateComment.hasFocus) {
      bool isAuth = Provider.of<AuthProvider>(context, listen: false).isAuth;
      if (!isAuth) {
        focusCreateComment.unfocus();
        Navigator.of(context).pushNamed(AppRoute.login);
        Toast.warning(context, "Cần đăng nhập để bình luận!");
      }
    }
  }

  void onCreateComment() async {
    try {
      String message = commentMessageController.text;
      Response res = await CommentService.postComment({
        "message": message,
        "commentable_id": widget.commentableId,
        "commentable_type": widget.commentableType,
        "parent_id": widget.parentId
      });
      if (res.statusCode == 200) {
        Comment newComment = Comment.fromJson(res.data['data']);
        widget.addComment(newComment);

        commentMessageController.clear();
        // ignore: use_build_context_synchronously
        FocusScope.of(context).unfocus();
        // ignore: use_build_context_synchronously
        Toast.success(context, "Bình luận thành công");
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusCreateComment,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: commentMessageController,
      maxLines: null,
      decoration: InputDecoration(
        hintText: widget.isChild ? "Thêm trả lời" : "Thêm bình luận",
        prefixIcon: const Icon(Icons.message),
        suffixIcon: IconButton(
          onPressed: () {
            if (commentMessageController.text.isEmpty) {
              Toast.warning(context, 'Nội dung bình luận không thể để trống');
              return;
            }
            onCreateComment();
          },
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }
}
