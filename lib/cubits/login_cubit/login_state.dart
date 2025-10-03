part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {}
final class LoginFail extends LoginState {
  String errorMessage;
  LoginFail({required this.errorMessage});
}

