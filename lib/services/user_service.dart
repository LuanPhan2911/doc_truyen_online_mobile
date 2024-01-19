import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/configs/app_http.dart';

class UserService {
  static Future<Response> getHistoryReadingPaginate(int? page) {
    return dio().get(
      "/api/users/stories/reading/paginate",
      queryParameters: {"page": page},
    );
  }

  static Future<Response> updateHistoryReadingNotifies(int storyId) {
    return dio().post(
      "/api/users/stories/$storyId/notifies",
    );
  }

  static Future<Response> deleteHistoryReading(int storyId) {
    return dio().delete(
      "/api/users/stories/$storyId/reading/delete",
    );
  }
}
