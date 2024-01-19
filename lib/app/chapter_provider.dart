import 'package:doc_truyen_online_mobile/data/utils/chapter_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';

class ChapterProvider extends ChangeNotifier {
  List<ChapterColor> colors = [
    ChapterColor(
      background: const Color.fromARGB(255, 52, 52, 50),
      foreground: AppColor.white,
    ),
    ChapterColor(
      background: AppColor.black,
      foreground: AppColor.white,
    ),
    ChapterColor(
      background: AppColor.white,
      foreground: AppColor.black,
    ),
    ChapterColor(
      background: const Color.fromARGB(255, 72, 218, 150),
      foreground: AppColor.black,
    ),
    ChapterColor(
      background: const Color.fromARGB(255, 243, 241, 155),
      foreground: AppColor.black,
    ),
  ];

  List<String> fonts = [
    'Roboto',
    'Lato',
    'Open Sans',
    'Inter',
    'Oswald',
    'Raleway'
  ];

  String font = 'Roboto';
  double fontSize = 18;
  ChapterColor color = ChapterColor(
    background: AppColor.black,
    foreground: AppColor.white,
  );
  void changeFontSize(fontSize) {
    this.fontSize = fontSize;
    notifyListeners();
  }

  void changeColor(ChapterColor color) {
    this.color = color;
    notifyListeners();
  }

  void changeFont(String font) {
    this.font = font;
    notifyListeners();
  }
}
