import 'package:dio/dio.dart' as Dio;
import 'package:doc_truyen_online_mobile/services/app_http.dart';

class AuthService {
  static Future<Dio.Response> login(Map data) {
    return dio().post("/api/login", data: data);
  }

  static Future<Dio.Response> register(Map data) {
    return dio().post("/api/register", data: data);
  }

  static Future<Dio.Response> tryToken() {
    return dio().get(
      "/api/user",
    );
  }

  static Future<Dio.Response> logout() {
    return dio().get(
      "/api/logout",
    );
  }

  static Future<Dio.Response> edit(data) {
    return dio().post("/api/users/edit", data: data);
  }
}
