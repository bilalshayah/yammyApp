import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://yammybackend-production.up.railway.app/api/v1/',
      connectTimeout: const Duration(seconds: 15),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
       validateStatus: (status) => status! < 500,
    ),
  );
}