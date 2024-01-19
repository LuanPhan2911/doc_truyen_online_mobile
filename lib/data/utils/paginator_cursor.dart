class PaginatorCursor<T> {
  List<T> data;
  String? nextCursor;
  String? prevCursor;
  int perPage;

  PaginatorCursor({
    required this.data,
    required this.nextCursor,
    required this.prevCursor,
    required this.perPage,
  });
  factory PaginatorCursor.fromJson(data, T Function(dynamic t) cast) {
    return PaginatorCursor<T>(
      data: List.from(data['data']).map((e) => cast(e)).toList(),
      nextCursor: data['next_cursor'],
      prevCursor: data['prev_cursor'],
      perPage: data['per_page'],
    );
  }
  bool isLastPage() {
    return this.nextCursor == null;
  }
}
