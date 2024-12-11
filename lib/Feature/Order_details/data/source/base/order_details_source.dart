abstract class OrderDetailsSource {
  Future<Map<String, dynamic>> orderDetails(String id);
  Future<Map<String, dynamic>> cancelOrder(
    int id, {
    required String cancelOrder,
  });

  // Future<Map<String, dynamic>> cancelService(
  //   String orderId,
  //   String serviceId,
  // );
}
