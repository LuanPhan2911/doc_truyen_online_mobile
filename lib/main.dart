import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).tryToken();
  }

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
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColor.blue,
        ),
        brightness: Brightness.dark,
      ),
      initialRoute: AppRoute.home,
      routes: AppRoute.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
