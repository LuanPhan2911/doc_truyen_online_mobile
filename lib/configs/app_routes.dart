import 'package:doc_truyen_online_mobile/pages/bottom_navigate.dart';
import 'package:doc_truyen_online_mobile/pages/home_page.dart';
import 'package:doc_truyen_online_mobile/pages/profile_page.dart';
import 'package:doc_truyen_online_mobile/pages/story_notify_page.dart';
import 'package:doc_truyen_online_mobile/pages/story_reading_page.dart';

class AppRoute {
  static String home = "/";
  static String explore = "/explored";
  static String reading = "/reading";
  static String notify = "/notify";
  static String profile = "/profile";

  static final routes = {
    home: (context) => const BottomNavigate(),
  };
  static const bottomNavigate = [
    StoryReadingPage(),
    HomePage(),
    StoryNotifyPage(),
    ProfilePage()
  ];
}
