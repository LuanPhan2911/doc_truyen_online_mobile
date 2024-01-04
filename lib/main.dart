import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoute.home,
      routes: AppRoute.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
