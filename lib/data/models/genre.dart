class Genre {
  int? id;
  String? name;
  String? slug;
  int? type;
  Genre({
    required this.id,
    required this.name,
    this.slug,
    this.type,
  });
  factory Genre.fromJson(data) {
    return Genre(
      id: data['id'],
      name: data['name'],
      slug: data['slug'],
      type: data['type'],
    );
  }
  static List<Genre> castGenres(data) {
    return List.from(data).map((e) => Genre.fromJson(e)).toList();
  }

  static List<Map<String, dynamic>> getFilterGenres(List<Genre> data) {
    return data
        .map((e) => {
              "label": e.name,
              "value": e.id,
              "isSelected": false,
            })
        .toList()
      ..insert(0, {"label": "Tất cả", "value": 0, "isSelected": true});
  }
}
