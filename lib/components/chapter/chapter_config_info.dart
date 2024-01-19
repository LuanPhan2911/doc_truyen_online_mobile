import 'package:doc_truyen_online_mobile/components/comments/comments.dart';
import 'package:doc_truyen_online_mobile/data/models/chapter.dart';
import 'package:doc_truyen_online_mobile/data/models/comment.dart';
import 'package:doc_truyen_online_mobile/data/models/story.dart';
import 'package:doc_truyen_online_mobile/pages/chapter_list_page.dart';
import 'package:doc_truyen_online_mobile/pages/story_detail.dart';
import 'package:flutter/material.dart';

class ChapterConfigInfo extends StatelessWidget {
  final VoidCallback onReload;
  final Chapter chapter;
  const ChapterConfigInfo({
    super.key,
    required this.chapter,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    String slug = chapter.story!.slug;
    int index = chapter.index;
    int storyId = chapter.storyId!;
    int commentsCount = chapter.story!.commentsCount!;
    return Column(
      children: [
        ListTile(
          title: const Text("Tải lại chương"),
          onTap: () => onReload(),
          leading: const Icon(Icons.refresh),
        ),
        ListTile(
          title: const Text("Danh sách chương"),
          onTap: () {
            Navigator.of(context).pop();
            Chapter.showChapterList(context, slug: slug, index: index);
          },
          leading: const Icon(Icons.menu),
        ),
        ListTile(
          title: const Text("Thông tin truyện"),
          onTap: () {
            Story.showStoryDetail(context, slug);
          },
          leading: const Icon(Icons.book),
        ),
        ListTile(
          title: Text("Bình luận ($commentsCount)"),
          onTap: () {
            Comment.showComments(context,
                storyId: storyId, commentCount: commentsCount);
          },
          leading: const Icon(Icons.comment),
        ),
        ListTile(
          title: const Text("Báo lỗi"),
          onTap: () {},
          leading: const Icon(Icons.flag),
        ),
      ],
    );
  }
}
