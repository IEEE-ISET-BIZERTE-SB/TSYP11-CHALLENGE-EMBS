import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/features/auth/data/models/userModel.dart';
import 'package:mobile_front_end/core/exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getCachedUser();
  Future<Unit> cacheUser(UserModel user);
  Future<Unit> clearCachedUser();
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheUser(UserModel user) {
    sharedPreferences.setString("CACHED_USER", json.encode(user.toJson()));
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCachedUser() {
    final userJsonString = sharedPreferences.getString("CACHED_USER");
    if (userJsonString != null) {
      UserModel user = UserModel.fromJson(json.decode(userJsonString));
      return Future.value(user);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> clearCachedUser() {
    sharedPreferences.remove("CACHED_USER");
    return Future.value(unit);
  }
}
