import 'package:flutter/foundation.dart';

enum UserStatus {
  PENDING,
  APPROVED,
  REJECTED,
}

class User {
  final int? id;
  final String email;
  final String password;
  final String username;
  late final UserStatus status;

  User({
    this.id,
    required this.email,
    required this.password,
    required this.username,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      username: json['username'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'username': username,

    };
  }
}
