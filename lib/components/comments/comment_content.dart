import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/components/comments/comments_child.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/data/models/user.dart';
import 'package:doc_truyen_online_mobile/helpers/format_date.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/services/comment_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:transparent_image/transparent_image.dart';

class CommentContent extends StatefulWidget {
  final Comment comment;
  final bool isChild;

  const CommentContent({
    super.key,
    required this.comment,
    required this.isChild,
  });

  @override
  State<CommentContent> createState() => _CommentContentState();
}

class _CommentContentState extends State<CommentContent> {
  int likeCount = 0;
  void onLikeComment(int commentId) async {
    try {
      Response res = await CommentService.likeComment(commentId);
      if (res.statusCode == 200) {
        String action = res.data['data']['action'];
        if (action == 'like') {
          likeCount++;
          ;
        } else {
          likeCount--;
        }
        setState(() {});
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    Comment comment = widget.comment;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ClipOval(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: Helper.asset(comment.user.avatar!),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.user.name,
                  style: AppText.subtitle,
                ),
                ReadMoreText(
                  widget.comment.message,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'đọc tiếp',
                  trimExpandedText: "ẩn",
                  moreStyle: AppText.contentBlue,
                  lessStyle: AppText.contentBlue,
                  style: AppText.content,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(FormatDate.date.format(comment.createdAt),
                          style: AppText.smallContent),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(
                                "${comment.likeCount + likeCount}",
                                style: AppText.smallContent,
                              ),
                              leading: const Icon(Icons.thumb_up),
                              onTap: () {
                                if (User.isAuth(context)) {
                                  onLikeComment(comment.id!);
                                }
                              },
                            ),
                          ),
                          widget.isChild
                              ? const SizedBox()
                              : Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "${comment.repliesCount!}",
                                      style: AppText.smallContent,
                                    ),
                                    leading: const Icon(Icons.comment),
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return CommentsChild(
                                            commentParent: comment,
                                          );
                                        },
                                      ));
                                    },
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
