import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/services/app_http.dart';

class StoryService {
  static Future<Response> getStories() {
    return dio().get(
      "/api/stories",
    );
  }

  static Future<Response> getStory(String slug) {
    return dio().get(
      "/api/stories/$slug",
    );
  }
}
