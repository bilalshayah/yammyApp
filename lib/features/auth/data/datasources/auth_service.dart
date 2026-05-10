import 'package:dio/dio.dart';
import 'package:yammyapp/core/constants/app_endpoints.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<Response> login(String email, String password) async {
    return await _dio.post(
      AppEndpoints.login,
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
      AppEndpoints.register,
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
