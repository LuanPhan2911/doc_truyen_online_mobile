import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/services/app_http.dart';

class CommentService {
  static Future<Response> getComments(String storyId) {
    return dio().get("/api/comments", queryParameters: {"story_id": storyId});
  }

  static Future<Response> getCommentReplies(String commentId) {
    return dio().get("/api/comments/replies",
        queryParameters: {"comment_id": commentId});
  }
}
