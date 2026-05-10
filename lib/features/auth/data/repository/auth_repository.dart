import 'package:dio/dio.dart';
import 'package:yammyapp/core/constants/constants.dart';
import '../../../../core/api_helper/dio_client.dart';
import '../models/user_model.dart';

class AuthRepository {

  final DioClient dioClient;

  AuthRepository({required this.dioClient});

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await dioClient.dio.post(
        AppEndpoints.login,
        data: {"email": email, "password": password},
      );

      return UserModel.fromJson(response.data);

    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Error";
    }
  }
  Future<void> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await dioClient.dio.post(
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
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Registration failed";
    }
  }
  Future<void> resetPassword({required String token, required String newPassword}) async {
    try {
      final response = await dioClient.dio.post(
        AppEndpoints.resetPassword,
        data: {
          'token': token,
          'new_password': newPassword,
        },
      );
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Something went wrong";
    }
  }
}