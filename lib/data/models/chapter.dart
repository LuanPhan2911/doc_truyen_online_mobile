class Chapter {
  String id;
  String name;
  String index;
  String? content;
  DateTime createdAt;
  Chapter({
    required this.id,
    required this.name,
    required this.index,
    this.content,
    required this.createdAt,
  });
  factory Chapter.fromJson(Map<String, dynamic> data) {
    return Chapter(
      id: data['id'].toString(),
      name: data['name'],
      index: data['index'].toString(),
      content: data['content'] ?? "",
      createdAt: DateTime.parse(data['created_at']),
    );
  }
}
