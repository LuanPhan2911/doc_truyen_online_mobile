class Genre {
  String id;
  String name;
  String? slug;
  String? type;
  Genre({
    required this.id,
    required this.name,
    this.slug,
    this.type,
  });
  factory Genre.fromJson(json) {
    return Genre(
      id: json['id'].toString(),
      name: json['name'],
      slug: json['slug'],
      type: json['type'].toString(),
    );
  }
}
