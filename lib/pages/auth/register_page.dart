import 'package:dio/dio.dart' as Dio;
import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/helpers/toast.dart';
import 'package:doc_truyen_online_mobile/services/auth_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void handleRegister(context) async {
    if (_formKey.currentState!.validate()) {
      try {
        Dio.Response res = await AuthService.register({
          "name": _nameController.text,
          "email": _emailController.text,
          "password": _passwordController.text,
          "device_name": "mobile",
        });
        if (res.data['success'] as bool) {
          Provider.of<AuthProvider>(context, listen: false)
              .login(token: res.data['token']);
          Navigator.of(context).pop();
          Toast.success(context, "Đăng ký thành công");
        }
      } on Dio.DioException catch (e) {
        Toast.error(context, "Vui lòng kiểm tra lại thông tin đã nhập");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng ký"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Tên tài khoản',
                    prefixIcon: Icon(Icons.text_format),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng điền tên!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
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
                TextFormField(
                  obscureText: true,
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Nhập lại mật khẩu',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value != _passwordController.text) {
                      return 'Mật khẩu nhập lại không chính xác!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => handleRegister(context),
                    style: AppColor.textBtnBlue,
                    child: const Text(
                      'Đăng ký',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
