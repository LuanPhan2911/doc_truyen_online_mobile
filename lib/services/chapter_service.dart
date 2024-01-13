import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/configs/app_http.dart';

class ChapterService {
  static Future<Response> getChapterList(String slug) {
    return dio().get(
      "/api/stories/$slug/chapter",
    );
  }

  static Future<Response> getChapter(String slug, int index) {
    return dio().get(
      "/api/stories/$slug/chapter/$index",
    );
  }
}
