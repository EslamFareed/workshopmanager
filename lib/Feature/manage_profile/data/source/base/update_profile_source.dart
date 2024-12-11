abstract class UpdateProfileSource {
  Future<Map<String, dynamic>> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String companyName,
    required String method,
  });
}
