import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/core/exceptions/exceptions.dart';
import 'package:mobile_front_end/core/network/network_info.dart';
import 'package:mobile_front_end/features/auth/data/datasources/user_local_data_source.dart';
import 'package:mobile_front_end/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:mobile_front_end/features/auth/data/models/userModel.dart';
import 'package:mobile_front_end/features/auth/domain/entities/userEntity.dart';
import 'package:mobile_front_end/features/auth/domain/repositories/userRepository.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networtkInfo;
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl(
      {required this.networtkInfo,
      required this.userLocalDataSource,
      required this.userRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> signIn(UserEntity user) async {
    final UserModel userModel =
        UserModel(username: user.username, password: user.password);
    if (await networtkInfo.isConnected) {
      try {
        final remoteUser = await userRemoteDataSource.signInUser(userModel);
        userLocalDataSource.cacheUser(remoteUser);
        return const Right(unit);
      } on LoginException {
        return Left(LoginFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    userLocalDataSource.clearCachedUser();
    return const Right(unit);
  }

  @override
  Future<UserEntity?> getCachedUser() async {
    try {
      final UserModel userModel = await userLocalDataSource.getCachedUser();
      UserEntity userEntity = UserEntity(
          username: userModel.username,
          password: userModel.password,
          id: userModel.id,
          roles: userModel.roles,
          accessToken: userModel.accessToken);
      return userEntity;
    } catch (e) {
      return null;
    }
  }
}
