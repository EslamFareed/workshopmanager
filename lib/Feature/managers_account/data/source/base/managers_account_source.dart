abstract class ManagersAccountSource {
  Future<Map<String, dynamic>> getAllEmployer();
  Future<Map<String, dynamic>> deleteEmployer(String id);
  Future<Map<String, dynamic>> activeEmployer(
    String id, {
    required String method,
  });
}
