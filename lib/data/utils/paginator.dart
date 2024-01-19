class Paginator<T> {
  List<T> data;
  int? perPage;
  int? lastPage;
  int firstPage = 1;
  int? currentPage;

  Paginator({
    required this.data,
    required this.perPage,
    required this.lastPage,
    required this.currentPage,
  });
  factory Paginator.fromJson(
      Map<String, dynamic> data, T Function(dynamic t) cast) {
    return Paginator<T>(
        data: List.from(data['data']).map((e) => cast(e)).toList(),
        perPage: data['per_page'],
        lastPage: data['last_page'],
        currentPage: data['current_page']);
  }
  int? nextPage() {
    return currentPage! < lastPage! ? currentPage! + 1 : null;
  }

  int? prevPage() {
    return currentPage! > firstPage ? currentPage! - 1 : null;
  }

  bool isLastPage() {
    return currentPage == lastPage;
  }
}
