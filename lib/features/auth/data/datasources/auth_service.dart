import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://yammybackend-production.up.railway.app/api/v1/',
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<Response> login(String email, String password) async {
    return await _dio.post(
      'auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<Response> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
  }) async {
    return await _dio.post(
      'auth/register',
      data: {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "phone": phone,
        "role": "CUSTOMER",
      },
    );
  }
}
