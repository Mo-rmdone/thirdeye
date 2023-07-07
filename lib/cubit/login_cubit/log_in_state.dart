part of 'log_in_cubit.dart';

@immutable
abstract class LogInState {}


class LogInInitial extends LogInState {}

class LogInSuccess extends LogInState {}
class LogInInLoading extends LogInState {}
class LogInInError extends LogInState {
  final String error;

  LogInInError(this.error);

}

class LogInShowPasswordState extends LogInState{}