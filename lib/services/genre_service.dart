import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/configs/app_http.dart';

class GenreService {
  static Future<Response> getGenres() {
    return dio().get("/api/genres");
  }
}
