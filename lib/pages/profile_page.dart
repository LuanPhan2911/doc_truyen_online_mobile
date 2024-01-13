import 'dart:math';

import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/pages/auth/edit_profile_page.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

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
            String? avatar = value.user?.avatar;
            String name = value.user!.name;
            String email = value.user?.email ?? "";
            String defaultAvatar = "assets/black_profile.png";
            return ListView(
              children: [
                SizedBox(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipOval(
                          child: avatar == null
                              ? Image.asset(
                                  defaultAvatar,
                                  fit: BoxFit.cover,
                                )
                              : FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: Helper.asset(avatar),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: AppText.title,
                          ),
                          Text(
                            email,
                            style: AppText.content,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
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
