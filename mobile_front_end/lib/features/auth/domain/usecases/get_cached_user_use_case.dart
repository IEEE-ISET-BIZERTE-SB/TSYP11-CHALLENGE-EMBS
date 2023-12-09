import 'package:mobile_front_end/features/auth/domain/entities/userEntity.dart';
import 'package:mobile_front_end/features/auth/domain/repositories/userRepository.dart';

class GetCachedUserUseCase {
  final UserRepository userRepository;
  GetCachedUserUseCase(this.userRepository);
  Future<UserEntity?> call() async {
    return await userRepository.getCachedUser();
  }
}
