import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/auth/domain/entities/userEntity.dart';
import 'package:mobile_front_end/features/auth/domain/repositories/userRepository.dart';

class SignInUserUseCase {
  final UserRepository userRepository;
//injecter par SL
  SignInUserUseCase(this.userRepository);
  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await userRepository.signIn(user);
  }
}
