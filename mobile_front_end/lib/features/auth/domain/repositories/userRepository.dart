import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/auth/data/models/userModel.dart';
import 'package:mobile_front_end/features/auth/domain/entities/userEntity.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> signIn(UserEntity user);
  Future<Either<Failure, Unit>> signOut();
  Future<UserEntity?> getCachedUser();
  Future<UserModel> signUp(String email, String password);
}
