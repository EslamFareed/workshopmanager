abstract class ShowManagerSource {
  Future<Map<String, dynamic>> showManager(String id);
  Future<Map<String, dynamic>> updateManager(
    String id, {
    required String name,
    required String email,
    required String phone,
    required List workshopsId,
    required String password,
    required String confirmPassword,
    required String jobTitle,
    required String method,
  });
}
