abstract class LoginSource {
  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
    required String deviceId,
    required String deviceToken,
    required String devicename,
  });
}
