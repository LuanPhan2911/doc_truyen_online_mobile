import 'package:flutter/material.dart';

class ChapterConfigSetting extends StatefulWidget {
  const ChapterConfigSetting({super.key});

  @override
  State<ChapterConfigSetting> createState() => _ChapterConfigSettingState();
}

enum ReadingMode { flip, scroll }

class _ChapterConfigSettingState extends State<ChapterConfigSetting> {
  ReadingMode readingMode = ReadingMode.flip;
  int fontSize = 16;
  Color backgroundColor = Colors.black;
  static List<String> fonts = ['Arial', 'Times new Roman', 'Verdana'];
  String font = fonts.first;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Chế độ đọc",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton(
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(
                    value: ReadingMode.flip,
                    label: Text("Lật trang"),
                    icon: Icon(Icons.vertical_distribute),
                  ),
                  ButtonSegment(
                    value: ReadingMode.scroll,
                    label: Text("Cuộn dọc"),
                    icon: Icon(Icons.horizontal_distribute),
                  ),
                ],
                selected: {readingMode},
                onSelectionChanged: (item) {
                  setState(() {
                    readingMode = item.first;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Cỡ chữ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            ListTile(
              leading: const Icon(Icons.text_decrease),
              trailing: const Icon(Icons.text_increase),
              title: Slider(
                value: fontSize.toDouble(),
                min: 10,
                max: 30,
                label: "$fontSize",
                onChanged: (value) {
                  setState(() {
                    fontSize = value.toInt();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Màu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(8, (index) {
                  return ClipOval(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                      ),
                    ),
                  );
                })
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Phong chữ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            ...fonts.map((e) {
              return RadioListTile(
                  value: e,
                  groupValue: font,
                  title: Text('$e'),
                  onChanged: (value) {
                    setState(() {
                      font = value as String;
                    });
                  });
            }).toList(),
          ],
        ),
      ),
    );
  }
}
