import 'package:dio/dio.dart' as Dio;
import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/helpers/toast.dart';
import 'package:doc_truyen_online_mobile/services/auth_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void handleLogin(context) async {
    if (_formKey.currentState!.validate()) {
      try {
        Dio.Response res = await AuthService.login({
          "email": _emailController.text,
          "password": _passwordController.text,
          "device_name": "mobile",
        });

        String token = res.data['token'];
        Provider.of<AuthProvider>(context, listen: false).login(token: token);
        Toast.success(context, "Đăng nhập thành công");
        Navigator.of(context).pop();
      } on Dio.DioException catch (e) {
        Toast.error(context, "Email hoặc mật khẩu không đúng");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Đăng nhập",
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/auth.jpg",
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng điền email!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Mật khẩu',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng điền mật khẩu!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => handleLogin(context),
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
                        Navigator.of(context)
                            .pushNamed(AppRoute.forgotPassword);
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
      ),
    );
  }
}
