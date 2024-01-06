import 'package:dio/dio.dart' as Dio;
import 'package:doc_truyen_online_mobile/services/app_http.dart';

class AuthService {
  static Future<Dio.Response> login(Map data) {
    return dio().post("/api/login", data: data);
  }

  static Future<Dio.Response> register(Map data) {
    return dio().post("/api/register", data: data);
  }

  static Future<Dio.Response> tryToken(token) {
    return dio().get(
      "/api/user",
      options: Dio.Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );
  }

  static Future<Dio.Response> logout(token) {
    return dio().get(
      "/api/logout",
      options: Dio.Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );
  }
}
