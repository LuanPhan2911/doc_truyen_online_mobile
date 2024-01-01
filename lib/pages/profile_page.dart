import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Đăng nhập"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.login);
            },
          ),
          ListTile(
            title: const Text("Đăng ký"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoute.register);
            },
          ),
        ],
      ),
    );
  }
}
