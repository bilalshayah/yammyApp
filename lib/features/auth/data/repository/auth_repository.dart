import 'package:dio/dio.dart';
import 'package:yammyapp/core/constants/constants.dart';
import '../../../../core/api_helper/dio_client.dart';
import '../../../../core/storage/storage_service.dart';
import '../models/user_model.dart';

class AuthRepository {
  final Dio dio = Dio();
  final StorageService storageService = StorageService();


  Future<UserModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        AppEndpoints.login,
        data: {"email": email, "password": password},
      );

      final responseData = response.data["data"];
      final token = responseData["accessToken"];
      print("token : $token");

      if (token != null) {
        await storageService.saveToken(token);
      }

      return UserModel.fromJson(responseData);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<UserModel> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await dio.post(
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

      final responseData = response.data["data"];
      final token = responseData["accessToken"];

      if (token != null) {
        await storageService.saveToken(token);
        print("token : $token");
      }

      return UserModel.fromJson(responseData);
    } on DioException catch (e) {
      throw e.response?.data['message'];
    }
  }

  Future<void> resetPassword({required String token, required String newPassword}) async {
    try {
      await dio.post(
        AppEndpoints.resetPassword,
        data: {
          "token": token,
          "password": newPassword,
        },
      );
    } on DioException catch (e) {
      print("Server Error Detail: ${e.response?.data}");
      throw e.response?.data['message'] ?? "فشل تعيين كلمة السر";
    }
  }

  Future<String> requestForgetPasswordToken(String email) async {
    try {
      final response = await dio.post(
        AppEndpoints.forgotPassword,
        data: {"email": email},
      );


      final data = response.data;

      List<String> keysToTry = ['accessToken', 'token', 'access_token', 'token_key'];

      for (var key in keysToTry) {
        if (data[key] != null) return data[key].toString();
      }

      if (data['data'] != null) {
        var innerData = data['data'];

        if (innerData is List && innerData.isNotEmpty) {
          innerData = innerData[0];
        }

        if (innerData is Map) {
          for (var key in keysToTry) {
            if (innerData[key] != null) return innerData[key].toString();
          }
        }
      }

      throw "التوكين غير موجود في رد السيرفر. تأكدي من الـ Console";

    } on DioException catch (e) {
      print("DIO ERROR: ${e.response?.data}");
      throw e.response?.data['message'] ?? "خطأ من السيرفر";
    }
  }

  }
