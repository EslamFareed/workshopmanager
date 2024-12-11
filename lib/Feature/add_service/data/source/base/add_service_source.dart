abstract class AddServiceSource {
  Future<Map<String, dynamic>> addService(
    String id, {
    required String serviceId,
    required String time,
    required String cost,
    required String timeType,
  });
  Future<Map<String, dynamic>> activeService(String id);
}
