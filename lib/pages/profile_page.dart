import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/pages/auth/edit_profile_page.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản"),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          if (value.isAuth) {
            return ListView(
              children: [
                SizedBox(
                  height: 200,
                  child: UserAccountsDrawerHeader(
                    currentAccountPictureSize: const Size(100, 100),
                    decoration: const BoxDecoration(
                      color: AppColor.dart,
                    ),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://imgupscaler.com/images/samples/anime-after.webp",
                      ),
                    ),
                    accountName: Text(
                      value.user!.name,
                      style: AppText.title,
                    ),
                    accountEmail: Text(
                      value.user!.email,
                      style: AppText.content,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text("Cập nhật hồ sơ"),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const EditProfilePage();
                      },
                    ));
                  },
                ),
                ListTile(
                  title: const Text("Thoát"),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Provider.of<AuthProvider>(context, listen: false).logout();
                    Navigator.of(context).pushNamed(AppRoute.home);
                  },
                ),
              ],
            );
            ;
          } else {
            return ListView(
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
            );
          }
        },
      ),
    );
  }
}
