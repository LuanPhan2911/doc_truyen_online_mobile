import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quên mật khẩu"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://imgupscaler.com/images/samples/anime-after.webp",
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: AppColor.textBtnBlue,
                child: const Text(
                  'Quên mật khẩu',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
