import 'package:dio/dio.dart';
import 'package:yammyapp/core/constants/app_endpoints.dart';
import 'package:yammyapp/core/storage/storage_service.dart';
import '../../../../core/api_helper/dio_client.dart';
import '../models/notification_response.dart';

class NotificationRepository {

  final DioClient dioClient;
  final StorageService storageService = StorageService();

  NotificationRepository({required this.dioClient});


  Future<List<NotificationItem>> fetchNotifications() async {
    String? token = await StorageService().getToken();

    final response = await dioClient.dio.get(
      AppEndpoints.notifications,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200) {
      final notificationResponse = NotificationResponse.fromJson(response.data);
      return notificationResponse.notifications;
    }
    return [];
  }
}