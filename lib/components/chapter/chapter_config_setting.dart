import 'package:doc_truyen_online_mobile/app/chapter_provider.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterConfigSetting extends StatefulWidget {
  const ChapterConfigSetting({super.key});

  @override
  State<ChapterConfigSetting> createState() => _ChapterConfigSettingState();
}

enum ReadingMode { flip, scroll }

class _ChapterConfigSettingState extends State<ChapterConfigSetting> {
  ReadingMode readingMode = ReadingMode.flip;
  late double fontSize;
  late ChapterColor color;
  late List<ChapterColor> colors;
  late List<String> fonts;
  late String font;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fontSize = Provider.of<ChapterProvider>(context, listen: false).fontSize;
    color = Provider.of<ChapterProvider>(context, listen: false).color;
    colors = Provider.of<ChapterProvider>(context, listen: false).colors;

    fonts = Provider.of<ChapterProvider>(context, listen: false).fonts;
    font = Provider.of<ChapterProvider>(context, listen: false).font;
  }

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
              style: AppText.subtitle,
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
                value: fontSize,
                min: 15,
                max: 30,
                label: "${fontSize.toInt()}",
                divisions: 15,
                onChanged: (value) {
                  setState(() {
                    fontSize = value;
                  });
                },
                onChangeEnd: (value) {
                  Provider.of<ChapterProvider>(context, listen: false)
                      .changeFontSize(value);
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
                ...List.generate(colors.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<ChapterProvider>(context, listen: false)
                          .changeColor(colors[index]);
                    },
                    child: ClipOval(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colors[index].background,
                        ),
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
                  activeColor: AppColor.blue,
                  value: e,
                  groupValue: font,
                  title: Text(e),
                  onChanged: (value) {
                    setState(() {
                      font = value as String;
                    });
                    Provider.of<ChapterProvider>(context, listen: false)
                        .changeFont(e);
                  });
            }).toList(),
          ],
        ),
      ),
    );
  }
}
