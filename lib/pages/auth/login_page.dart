import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Đăng nhập",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://imgupscaler.com/images/samples/anime-after.webp",
                width: 200,
                height: 200,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Mật khẩu',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoute.home);
                  },
                  style: AppColor.textBtnBlue,
                  child: const Text(
                    'Đăng nhập',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoute.register);
                  },
                  style: AppColor.textBtnGrey,
                  child: const Text('Đăng ký'),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoute.verifyEmail);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.white,
                    ),
                    child: const Text("Gửi email kích hoạt"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoute.forgotPassword);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.white,
                    ),
                    child: const Text("Quên mật khẩu"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
