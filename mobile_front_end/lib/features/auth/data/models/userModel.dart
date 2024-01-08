import 'dart:convert';

import 'package:mobile_front_end/features/auth/domain/entities/userEntity.dart';

class UserModel extends UserEntity {
  UserModel({
    String? id,
    required String username,
    List<String>? roles,
    String? accessToken,
    String? password,
  }) : super(
            id: id,
            username: username,
            roles: roles,
            accessToken: accessToken) {
    this.password = password ?? '';
  }
  factory UserModel.fromFirebase(Map<String, dynamic> json) {
    return UserModel(
      id: json['uid'], // Firebase UID can be used as the ID
      username: json['email'],
      roles: <String>[], // Firebase doesn't provide roles directly
      accessToken: null, // Firebase uses tokens for authentication
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'roles': jsonEncode(roles),
      'accessToken': accessToken
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: '1', //json['id'].toString(),
        username: json['username'],
        password: json['password'],
        roles: List.from(json['roles']), //.cast<String>(),
        accessToken: json['accessToken']);
  }
}
