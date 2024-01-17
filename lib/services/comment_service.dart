import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/configs/app_http.dart';

class CommentService {
  static Future<Response> getComments(String? cursor, int storyId) {
    return dio().get("/api/comments",
        queryParameters: {"story_id": storyId, "cursor": cursor});
  }

  static Future<Response> getCommentReplies(int commentId) {
    return dio().get("/api/comments/replies",
        queryParameters: {"comment_id": commentId});
  }

  static Future<Response> postComment(data) {
    return dio().post("/api/comments/create", data: data);
  }

  static Future<Response> likeComment(commentId) {
    return dio().post("/api/comments/$commentId/like");
  }
}
