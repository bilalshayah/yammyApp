import 'package:dio/dio.dart';
import 'package:yammyapp/core/constants/app_endpoints.dart';
import 'package:yammyapp/core/storage/storage_service.dart';
import '../models/notification_response.dart';

class NotificationRepository {

  final Dio dio = Dio();
  final StorageService storageService = StorageService();



  Future<List<NotificationItem>> fetchNotifications() async {
    String? token = await StorageService().getToken();

    final response = await dio.get(
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