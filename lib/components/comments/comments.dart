import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_content.dart';
import 'package:doc_truyen_online_mobile/components/comments/comment_form.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/data/utils/paginator_cursor.dart';
import 'package:doc_truyen_online_mobile/services/comment_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Comments extends StatefulWidget {
  final int storyId;
  final int commentsCount;
  const Comments(
      {super.key, required this.storyId, required this.commentsCount});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final _pagingController =
      PagingController<String?, Comment>(firstPageKey: null);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((cursor) {
      fetchComment(cursor, widget.storyId);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pagingController.dispose();
  }

  Future<void> fetchComment(String? cursor, int storyId) async {
    try {
      Response res = await CommentService.getComments(cursor, storyId);
      var commentsPaginate = PaginatorCursor.fromJson(
          res.data['data'], (t) => Comment.fromJson(t));

      if (commentsPaginate.isLastPage()) {
        _pagingController.appendLastPage(commentsPaginate.data);
      } else {
        _pagingController.appendPage(
            commentsPaginate.data, commentsPaginate.nextCursor);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.commentsCount} bình luận"),
        centerTitle: true,
      ),
      bottomSheet: CommentForm(
        commentableId: widget.storyId,
        commentableType: "story",
        addComment: (newComment) {
          if (newComment != null) {
            _pagingController.refresh();
          }
        },
      ),
      body: Column(
        children: [
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
                      isChild: false,
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context) {
                    return const Center(
                      child: Text(
                        "Chưa có bình luận nào",
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
