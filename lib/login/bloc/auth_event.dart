// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent {}

class LoginClickEvent extends AuthEvent {
  final String email;
  final String password;
  LoginClickEvent({
    required this.email,
    required this.password,
  });
}
