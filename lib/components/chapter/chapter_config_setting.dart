import 'package:doc_truyen_online_mobile/app/chapter_provider.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class ChapterConfigSetting extends StatefulWidget {
  const ChapterConfigSetting({super.key});

  @override
  State<ChapterConfigSetting> createState() => _ChapterConfigSettingState();
}

class _ChapterConfigSettingState extends State<ChapterConfigSetting> {
  late double fontSize;
  late ChapterColor color;
  late List<ChapterColor> colors;
  late List<String> fonts;
  late String font;
  late int readingMode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fontSize = Provider.of<ChapterProvider>(context, listen: false).fontSize;
    color = Provider.of<ChapterProvider>(context, listen: false).color;
    colors = Provider.of<ChapterProvider>(context, listen: false).colors;

    fonts = Provider.of<ChapterProvider>(context, listen: false).fonts;
    font = Provider.of<ChapterProvider>(context, listen: false).font;
    readingMode =
        Provider.of<ChapterProvider>(context, listen: false).readingMode;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text(
                "Chế độ đọc",
                style: AppText.subtitle,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: ChapterReadingMode.flip,
                    label: const Text("Lật trang"),
                    icon: const Icon(Icons.vertical_distribute),
                  ),
                  ButtonSegment(
                    value: ChapterReadingMode.scroll,
                    label: const Text("Cuộn dọc"),
                    icon: const Icon(Icons.horizontal_distribute),
                  ),
                ],
                selected: {readingMode},
                onSelectionChanged: (item) {
                  setState(() {
                    readingMode = item.first;
                    Provider.of<ChapterProvider>(context, listen: false)
                        .changeReadingMode(readingMode);
                  });
                },
              ),
            ),
            const ListTile(
              title: Text(
                "Cỡ chữ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              trailing: Tooltip(
                message: "Thay đổi cỡ chữ chỉ được thực hiện ở chế độ cuộn",
                triggerMode: TooltipTriggerMode.tap,
                child: Icon(Icons.question_mark),
              ),
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
                onChanged: readingMode == ChapterReadingMode.flip
                    ? null
                    : (value) {
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
            const ListTile(
              title: Text(
                "Màu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
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
            const ListTile(
              title: Text(
                "Phong chữ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
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
