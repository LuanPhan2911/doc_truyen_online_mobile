import 'package:doc_truyen_online_mobile/components/comments/comments_child.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Comment comment = widget.comment;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              Helper.asset(comment.user.avatar!),
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
                      child: Text(comment.createdAt.toString(),
                          style: AppText.smallContent),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(
                            child: ListTile(
                              title: Text("3", style: AppText.smallContent),
                              leading: Icon(Icons.thumb_up),
                            ),
                          ),
                          widget.isChild
                              ? const SizedBox()
                              : Expanded(
                                  child: ListTile(
                                    title: Text(comment.repliesCount,
                                        style: AppText.smallContent),
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
