abstract class AuthEvent {}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}

class RegisterSubmitted extends AuthEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String phone;

  RegisterSubmitted({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.phone,
  });
}

class ForgetPasswordRequested extends AuthEvent {
  final String email;
  ForgetPasswordRequested({required this.email});
}

class ResetPasswordSubmitted extends AuthEvent {
  final String token;
  final String newPassword;

  ResetPasswordSubmitted({required this.token, required this.newPassword});
}

class LogoutRequested extends AuthEvent {}