import 'package:dio/dio.dart';
import 'package:yammyapp/core/constants/constants.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 15),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
       validateStatus: (status) => status! < 500,
    ),
  );
}