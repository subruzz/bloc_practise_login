part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String id;

  AuthSuccess(this.id);
}

final class AuthFailed extends AuthState {
  final String err;

  AuthFailed({required this.err});
}

final class AuthLoading extends AuthState {}
