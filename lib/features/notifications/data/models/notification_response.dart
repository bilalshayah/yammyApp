class NotificationResponse {
  final bool success;
  final List<NotificationItem> notifications;

  NotificationResponse({required this.success, required this.notifications});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data']['data'] as List;
    List<NotificationItem> itemsList = list.map((i) => NotificationItem.fromJson(i)).toList();

    return NotificationResponse(
      success: json['success'],
      notifications: itemsList,
    );
  }
}

class NotificationItem {
  final String title;
  final String message;

  NotificationItem({required this.title, required this.message});

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      title: json['title'] ?? 'no title',
      message: json['message'] ?? '',
    );
  }
}