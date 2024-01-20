import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData data = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.appBar,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.appBar,
      selectedIconTheme: IconThemeData(
        color: AppColor.blue,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColor.blue,
      indicatorColor: AppColor.blue,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColor.blue,
    ),
    brightness: Brightness.dark,
    sliderTheme: const SliderThemeData(
      activeTrackColor: AppColor.blue,
      thumbColor: AppColor.blue,
    ),
  );
}
