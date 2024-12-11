abstract class AddWorkshopManagerSource {
  Future<Map<String, dynamic>> addWorkshopManager({
    required String jobTitle,
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required List workshopsId,
  });
}
