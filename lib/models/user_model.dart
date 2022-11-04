import 'dart:convert';

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'] ?? 'First Name',
        lastName: json['last_name'] ?? 'Last Name',
        avatar: json['avatar'] ?? 'https://reqres.in/img/faces/8-image.jpg');
  }
}
