import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_content.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_form.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/data/utils/paginator_cursor.dart';
import 'package:doc_truyen_online_mobile/services/comment_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommentsChild extends StatefulWidget {
  final Comment commentParent;
  const CommentsChild({super.key, required this.commentParent});

  @override
  State<CommentsChild> createState() => _CommentsChildState();
}

class _CommentsChildState extends State<CommentsChild> {
  late Future<List<Comment>> commentReplies;
  final _pagingController =
      PagingController<String?, Comment>(firstPageKey: null);
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((cursor) {
      fetchCommentReplies(cursor, widget.commentParent.id!);
    });
  }

  Future<void> fetchCommentReplies(String? cursor, int commentId) async {
    try {
      Response res = await CommentService.getCommentReplies(commentId);
      var repliesPaginate = PaginatorCursor<Comment>.fromJson(
          res.data['data'], (t) => Comment.fromJson(t));
      if (repliesPaginate.isLastPage()) {
        _pagingController.appendLastPage(repliesPaginate.data);
      } else {
        _pagingController.appendPage(
            repliesPaginate.data, repliesPaginate.nextCursor);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết bình luận"),
      ),
      bottomSheet: CommentForm(
        commentableId: widget.commentParent.commentableId!,
        commentableType: "story",
        parentId: widget.commentParent.id,
        isChild: true,
        addComment: (newReply) {
          if (newReply != null) {
            _pagingController.refresh();
          }
        },
      ),
      body: Column(
        children: [
          CommentContent(
            isChild: true,
            comment: widget.commentParent,
          ),
          const Divider(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => Future.sync(
                () => _pagingController.refresh(),
              ),
              child: PagedListView.separated(
                builderDelegate: PagedChildBuilderDelegate<Comment>(
                  itemBuilder: (context, item, index) {
                    return CommentContent(
                      comment: item,
                      isChild: true,
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context) {
                    return const Center(
                      child: Text(
                        "Chưa có trả lời nào",
                        style: AppText.title,
                      ),
                    );
                  },
                ),

                // 4
                pagingController: _pagingController,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
