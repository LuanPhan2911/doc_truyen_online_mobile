import 'package:dio/dio.dart' as Dio;
import 'package:doc_truyen_online_mobile/data/models/user.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuth = false;
  User? user;
  bool get isAuth => _isAuth;
  final storage = const FlutterSecureStorage();

  void login({required String token}) async {
    await storage.write(key: 'token', value: token);
    try {
      Dio.Response res = await AuthService.tryToken();
      if (res.statusCode == 200) {
        user = User.fromJson(res.data['data']);
        _isAuth = true;
        notifyListeners();
      }
    } on Dio.DioException catch (e) {
      Helper.logWarning(e);
    }
  }

  void updateProfile(json) {
    user = User.fromJson(json);
    notifyListeners();
  }

  void tryToken() async {
    bool hasToken = await storage.containsKey(key: 'token');
    String? token = hasToken ? await storage.read(key: 'token') : null;
    if (token != null) {
      try {
        Dio.Response res = await AuthService.tryToken();
        if (res.statusCode == 200) {
          user = User.fromJson(res.data['data']);
          _isAuth = true;
        }
      } on Dio.DioException catch (e) {
        Helper.logWarning(e);
      }
    } else {
      _isAuth = false;
      user = null;
    }
    notifyListeners();
  }

  void logout() async {
    bool hasToken = await storage.containsKey(key: 'token');
    String? token = hasToken ? await storage.read(key: 'token') : null;
    if (token != null) {
      try {
        Dio.Response res = await AuthService.logout();
        if (res.statusCode == 200) {
          await storage.delete(key: 'token');
          user = null;
          _isAuth = false;
        }
      } on Dio.DioException catch (e) {
        Helper.logWarning(e);
      }
    }
    notifyListeners();
  }
}
