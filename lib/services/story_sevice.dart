import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/configs/app_http.dart';

class StoryService {
  static Future<Response> getStories(Map<String, dynamic> qs) {
    return dio().get("/api/stories", queryParameters: qs);
  }

  static Future<Response> getFilterStories(Map<String, dynamic> qs) {
    return dio().get(
      "/api/stories/filter",
      queryParameters: qs,
    );
  }

  static Future<Response> getStory(String slug) {
    return dio().get(
      "/api/stories/$slug",
    );
  }
}
