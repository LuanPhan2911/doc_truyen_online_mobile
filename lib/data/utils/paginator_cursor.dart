import 'dart:convert';

import 'package:doc_truyen_online_mobile/data/models/comment.dart';

class PaginatorCursor {
  List data;
  String? nextCursor;
  String? prevCursor;
  int perPage;

  PaginatorCursor({
    required this.data,
    required this.nextCursor,
    required this.prevCursor,
    required this.perPage,
  });
  factory PaginatorCursor.fromJson(data) {
    return PaginatorCursor(
      data: List.from(data['data']).map((e) => e).toList(),
      nextCursor: data['next_cursor'],
      prevCursor: data['prev_cursor'],
      perPage: data['per_page'],
    );
  }
}
