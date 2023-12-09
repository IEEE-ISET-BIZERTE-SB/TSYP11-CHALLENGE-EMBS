import 'package:equatable/equatable.dart';
import 'package:mobile_front_end/features/auth/domain/entities/userEntity.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final UserEntity user;
  LoginEvent({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class LogOutEvent extends AuthEvent {}
