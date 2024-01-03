import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontSize: 18),
                ),
                const ReadMoreText(
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'đọc tiếp',
                  trimExpandedText: "ẩn",
                  moreStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("3 nam truoc"),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                        const Text("3"),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoute.commentChild);
                            },
                            icon: const Icon(Icons.comment)),
                        const Text("3"),
                      ],
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
