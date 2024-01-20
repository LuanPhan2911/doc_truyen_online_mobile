class Author {
  int? id;
  String? name;
  String? slug;
  Author({this.id, this.name, this.slug});
  factory Author.fromJson(data) {
    return Author(id: data['id'], name: data['name'], slug: data['slug']);
  }
}
