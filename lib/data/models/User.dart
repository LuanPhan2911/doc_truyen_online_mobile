class User {
  String id;
  String name;
  String? email;
  String? avatar;
  String? birthDate;
  String? gender;
  String? description;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.birthDate,
    required this.gender,
    required this.description,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      birthDate: json['birth_date'],
      gender: json['gender'].toString(),
      description: json['description'],
    );
  }
}
