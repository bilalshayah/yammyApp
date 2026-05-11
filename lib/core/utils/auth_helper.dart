import '../storage/storage_service.dart';

class AuthHelper {
  static Future<bool> isAuthenticated(StorageService storageService) async {
    final token = await storageService.getToken();
    return token != null && token.isNotEmpty;
  }
}