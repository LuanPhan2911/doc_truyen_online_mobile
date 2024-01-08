import 'package:doc_truyen_online_mobile/components/layouts/bottom_navigate.dart';
import 'package:doc_truyen_online_mobile/components/comments/comments.dart';
import 'package:doc_truyen_online_mobile/pages/chapter_page.dart';
import 'package:doc_truyen_online_mobile/pages/auth/forgot_password_page.dart';
import 'package:doc_truyen_online_mobile/pages/home_page.dart';
import 'package:doc_truyen_online_mobile/pages/auth/login_page.dart';
import 'package:doc_truyen_online_mobile/pages/profile_page.dart';
import 'package:doc_truyen_online_mobile/pages/auth/register_page.dart';
import 'package:doc_truyen_online_mobile/pages/story_detail.dart';
import 'package:doc_truyen_online_mobile/pages/story_notify_page.dart';
import 'package:doc_truyen_online_mobile/pages/story_reading_page.dart';
import 'package:doc_truyen_online_mobile/pages/story_search_page.dart';
import 'package:doc_truyen_online_mobile/pages/auth/verify_email_page.dart';

class AppRoute {
  static String home = "/";
  static String explore = "/explored";
  static String reading = "/reading";
  static String notify = "/notify";
  static String profile = "/profile";
  static String login = "/login";
  static String register = "/register";
  static String verifyEmail = "/register_verify";
  static String forgotPassword = "/forgot_password";
  static String storySearch = "/search";
  static String storyDetail = "/story";
  static final routes = {
    home: (context) => const BottomNavigate(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    verifyEmail: (context) => const VerifyEmailPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    storySearch: (context) => const StorySearchPage(),
  };
  static const bottomNavigate = [
    StoryReadingPage(),
    HomePage(),
    StoryNotifyPage(),
    ProfilePage()
  ];
}
