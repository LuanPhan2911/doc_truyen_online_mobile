import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:flutter/material.dart';

class BottomNavigate extends StatefulWidget {
  const BottomNavigate({super.key});

  @override
  State<BottomNavigate> createState() => _BottomNavigateState();
}

class _BottomNavigateState extends State<BottomNavigate> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppRoute.bottomNavigate[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Tủ truyện",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration_rounded),
            label: "Khám phá",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Thông báo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Hồ sơ",
          ),
        ],
      ),
    );
  }
}
