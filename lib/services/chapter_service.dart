import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/services/app_http.dart';

class ChapterService {
  static Future<Response> getChapterList(String slug) {
    return dio().get(
      "/api/stories/$slug/chapter",
    );
  }
}
