import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure() : super();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NoConnectionFailure extends Failure {}

class AuthenticationFailure extends Failure {}

class LoginFailure extends Failure {}
