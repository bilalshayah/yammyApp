import 'package:yammyapp/features/orders/presentation/bloc/order_bloc.dart';

class AppEndpoints {
  static const String baseUrl =
      'https://yammybackend-production.up.railway.app/api/v1';

  // Auth
  static const String login = '$baseUrl/auth/login';
  static const String register = '$baseUrl/auth/register';
  static const String logout = '$baseUrl/auth/logout';
  static const String logoutAll = '$baseUrl/auth/logout-all';
  static const String me = '$baseUrl/auth/me';
  static const String refresh = '$baseUrl/auth/refresh';
  static const String forgotPassword = '$baseUrl/auth/forgot-password';
  static const String resetPassword = '$baseUrl/auth/reset-password';
  static const String changePassword = '$baseUrl/auth/change-password';

  // Cart
  static const String cart = '$baseUrl/cart/';
  static const String cartItems = '$baseUrl/cart/items';
  static String deleteCartItem(String itemId) => '$baseUrl/cart/items/$itemId';

  // Menu
  static const String categories = '$baseUrl/categories/';
  static String category(String id) => '$baseUrl/categories/$id';
  static const String menuItems = '$baseUrl/menu-items/';
  static String menuItem(String id) => '$baseUrl/menu-items/$id';

  // Restaurants
  static const String restaurants = '$baseUrl/restaurants/';
  static String restaurant(String id) => '$baseUrl/restaurants/$id';
  static String restaurantMenu(String id) => '$baseUrl/restaurants/$id/menu';
  static String restaurantToggle(String id) => '$baseUrl/restaurants/$id/toggle-open';

  // Orders
  static const String orders = '$baseUrl/orders/';
  static String order(String id) => '$baseUrl/orders/$id';
  static String cancelOrder(String id) => '$baseUrl/orders/$id/cancel';
  static String orderStatus(String id) => '$baseUrl/orders/$id/status';

  // Delivery
  static String assignDriver(String orderId) => '$baseUrl/delivery/$orderId/assign-driver';
  static String deliveryLocation(String orderId) => '$baseUrl/delivery/$orderId/location';
  static String deliveryStatus(String orderId) => '$baseUrl/delivery/$orderId/status';
  static const String myDeliveries = '$baseUrl/delivery/my-deliveries';
  static String trackDelivery(String orderId) => '$baseUrl/delivery/track/$orderId';

  // Notifications
  static const String notifications = '$baseUrl/notifications/';
  static String markNotificationRead(String id) => '$baseUrl/notifications/$id/read';
  static const String markAllRead = '$baseUrl/notifications/mark-all-read';
  static const String unreadCount = '$baseUrl/notifications/unread-count';

  // Profile
  static const String profile = '$baseUrl/profile/';
  static const String addresses = '$baseUrl/profile/addresses';
  static String address(String id) => '$baseUrl/profile/addresses/$id';

  // Health
  static const String health = '$baseUrl/health/';
}