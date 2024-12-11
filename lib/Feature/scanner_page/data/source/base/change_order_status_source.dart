abstract class ChangeOrderStatusSource {
  Future<Map<String, dynamic>> changeOrderStatus(
    String id, {
    required String status,
    required String lat,
    required String lng,
    required String method,
  });
}
