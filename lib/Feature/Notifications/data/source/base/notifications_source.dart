abstract class NotificationsSource {
  Future<Map<String, dynamic>> notifications();
  Future<Map<String, dynamic>> changeNotificationStatus(String id);

  Future<Map<String, dynamic>> deleteNotification(String id);
}
