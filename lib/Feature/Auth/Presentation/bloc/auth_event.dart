import 'package:se7ety/Core/enums/User_type_enum.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final UserType userType;

  LoginEvent(
      {required this.email, required this.password, required this.userType});
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final UserType userType;

  RegisterEvent(
      {required this.email,
      required this.password,
      required this.name,
      required this.userType});
}
