import 'package:dartz/dartz.dart';
import 'package:mobile_front_end/core/error/failures.dart';
import 'package:mobile_front_end/features/auth/domain/repositories/userRepository.dart';

class SignOutUserUseCase {
  final UserRepository userRepository;
  SignOutUserUseCase(this.userRepository);
  Future<Either<Failure, Unit>> call() async {
    return await userRepository.signOut();
  }
}
