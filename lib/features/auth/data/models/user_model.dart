class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phone;
  final String? avatar;
  final String role;
  final String accessToken;
  final String refreshToken;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.avatar,
    required this.role,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json['data']['user'];

    return UserModel(
      id: userData['id'],
      email: userData['email'],
      firstName: userData['first_name'] ?? '',
      lastName: userData['last_name'] ?? '',
      phone: userData['phone'],
      avatar: userData['avatar'],
      role: userData['role'],
      accessToken: json['data']['accessToken'],
      refreshToken: json['data']['refreshToken'],
    );
  }
}