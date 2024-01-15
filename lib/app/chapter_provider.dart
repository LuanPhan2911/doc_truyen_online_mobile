import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';

class ChapterColor {
  Color background;
  Color foreground;
  ChapterColor({
    required this.background,
    required this.foreground,
  });
}

class ChapterReadingMode {
  static int flip = 1;
  static int scroll = 2;
}

class ChapterProvider extends ChangeNotifier {
  double fontSize = 18;
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

  ChapterColor color = ChapterColor(
    background: AppColor.black,
    foreground: AppColor.white,
  );

  List<String> fonts = [
    'Roboto',
    'Lato',
    'Open Sans',
    'Inter',
    'Oswald',
    'Raleway'
  ];
  String font = 'Roboto';

  int readingModeScroll = ChapterReadingMode.scroll;
  int readingModeFlip = ChapterReadingMode.flip;

  int readingMode = ChapterReadingMode.scroll;
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

  void changeReadingMode(int readingMode) {
    this.readingMode = readingMode;
    notifyListeners();
  }
}
