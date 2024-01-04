import 'package:flutter/material.dart';

class ChapterConfigInfo extends StatelessWidget {
  const ChapterConfigInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Danh sách chương"),
          onTap: () {},
          leading: const Icon(Icons.menu),
        ),
        ListTile(
          title: const Text("Thông tin truyện"),
          onTap: () {},
          leading: const Icon(Icons.book),
        ),
        ListTile(
          title: const Text("Bình luận"),
          onTap: () {},
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
