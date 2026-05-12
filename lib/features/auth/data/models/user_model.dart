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
    // محاولة الحصول على البيانات من 'user' أو 'data' أو استخدام الـ json نفسه
    final userData = json['user'] ?? json['data'] ?? json;

    return UserModel(
      id: (userData['id'] ?? userData['_id'] ?? '').toString(),
      email: userData['email'] ?? '',
      firstName: userData['first_name'] ?? userData['firstName'] ?? '',
      lastName: userData['last_name'] ?? userData['lastName'] ?? '',
      phone: userData['phone'],
      avatar: userData['avatar'],
      role: userData['role'] ?? 'CUSTOMER',
      accessToken: json['accessToken'] ?? json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}