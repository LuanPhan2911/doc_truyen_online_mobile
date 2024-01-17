import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/configs/app_routes.dart';
import 'package:doc_truyen_online_mobile/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? birthDate;
  int? gender;
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

  factory User.fromJson(Map json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      description: json['description'],
    );
  }
  Map toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'birth_date': birthDate,
      'gender': gender,
      'description': description
    };
  }

  static bool isAuth(context) {
    bool isAuth = Provider.of<AuthProvider>(context, listen: false).isAuth;
    if (!isAuth) {
      Navigator.of(context).pushNamed(AppRoute.login);
      Toast.warning(context, "Cần đăng nhập để thực hiện!");
    }
    return isAuth;
  }
}
