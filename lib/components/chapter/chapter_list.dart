import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class ChapterList extends StatelessWidget {
  const ChapterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Số chương: 1212", style: AppText.subtitle),
            IconButton(
              style: AppColor.iconBtnBlue,
              onPressed: () {},
              icon: const Icon(Icons.sort),
            )
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              ...List.generate(
                100,
                (index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$index",
                            style: AppText.subtitle,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chuong 1: Mau den dia quaffffffffffffffffffffffffffffff",
                                  style: AppText.subtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "(2002/12/20 19:20)",
                                  style: AppText.content,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ],
    );
  }
}
