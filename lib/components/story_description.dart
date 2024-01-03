import 'package:flutter/material.dart';

class StoryDescription extends StatelessWidget {
  const StoryDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '15',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text("Chương/Tuần"),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '599',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text("Chương- Đang ra"),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '599',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text("Lượt đọc"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              "♬ TRACKLIST:\n"
              "00:00 Tan Ca - Đạt Ozy ft PiaLinhggggggggggggggggggggggg"
              "02:43 Mặt Mộc - Phạm Nguyên Ngọc x VAnh x Ân Nhi\n"
              "05:22 Nhất Trên Đời - Vanh\n"
              "08:13 Ghé Vào Tai - UMIE x Freaky x Hổ\n"
              "10:40 Iu Là Đây - Sean x Muội x Anfang\n"
              "13:26 Từng Quen - Wren Evans\n"
              "16:07 Miên Man - Minh Huy\n"
              "19:13 Bốn Mùa Thương Em - Lập Nguyên ft Night T x Yến Nồi Cơm Điện\n"
              "22:13 Rồi Ta Sẽ Ngắm Pháo Hoa Cùng Nhau - Olew\n"
              "24:59 Cứu Vãn Kịp Không - Vương Anh Tú\n"
              "28:11 Tát Nhật Lãng Rực Rỡ - Fanny\n"
              "30:58 Em Là Nhất - kis x Hoàng KayLee x Yahy\n"
              "34:10 Em Có Nghe - Kha\n"
              "37:05 Lưu Luyến Sau Chia Tay - Try92 ft Kai06\n"
              "40:45 Umee - H2K\n"
              "1:21:49 Kẻ Theo Đuổi Ánh Sáng - buitruonglinh\n",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
