import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_front_end/core/exceptions/exceptions.dart';
import 'package:mobile_front_end/features/auth/data/models/userModel.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> signInUser(UserModel userModel);
  Future<void> signOutUser();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});
  @override
  Future<UserModel> signInUser(UserModel userModel) async {
    final body = jsonEncode(
        {"username": userModel.username, "password": userModel.password});
    late final response;
    try {
      response = await client.post(
          Uri.parse("http://192.168.100.114:8081/api" + "/auth/signin/"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: body);
    } catch (e) {
      print("exception " + e.toString());
    }
    if (response.statusCode == 200) {
      try {
        final user = UserModel.fromJson(jsonDecode(response.body));
        return Future.value(user);
      } catch (e) {
        return Future.value(null);
      }
    } else {
      throw LoginException();
    }
  }

  @override
  Future<void> signOutUser() {
// TODO: implement signOutUser
    throw UnimplementedError();
  }
}
