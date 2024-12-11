abstract class ServiceSource {
  Future<Map<String, dynamic>> service(String id);
  Future<Map<String, dynamic>> suggestedService(
    String id, {
    required List brandList,
  });
}
