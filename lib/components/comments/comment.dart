import 'package:doc_truyen_online_mobile/components/comments/comments_child.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Comment extends StatelessWidget {
  final bool isChild;
  const Comment({super.key, this.isChild = false});

  @override
  Widget build(BuildContext context) {
    print(isChild);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://imgupscaler.com/images/samples/anime-after.webp",
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tên ủe",
                  style: AppText.subtitle,
                ),
                const ReadMoreText(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
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
                    const Expanded(
                        child:
                            Text("3 nam turco", style: AppText.smallContent)),
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
                          isChild
                              ? const SizedBox()
                              : Expanded(
                                  child: ListTile(
                                    title: const Text("3",
                                        style: AppText.smallContent),
                                    leading: const Icon(Icons.comment),
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return const CommentsChild();
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
