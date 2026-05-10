abstract class AuthEvent {}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitted(this.email, this.password);
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