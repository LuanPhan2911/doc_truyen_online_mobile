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

class ChapterProvider extends ChangeNotifier {
  double fontSize = 18;
  List<ChapterColor> colors = [
    ChapterColor(
      background: AppColor.black,
      foreground: AppColor.white,
    ),
    ChapterColor(
      background: AppColor.white,
      foreground: AppColor.black,
    ),
  ];

  ChapterColor color = ChapterColor(
    background: AppColor.black,
    foreground: AppColor.white,
  );

  List<String> fonts = [
    'Arial',
    'Times new Roman',
    'Verdana',
  ];
  String font = 'Arial';
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
