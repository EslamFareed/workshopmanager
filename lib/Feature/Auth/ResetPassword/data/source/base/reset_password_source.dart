abstract class ResetPasswordSource {
  Future<Map<String, dynamic>> resetPassword({
    required String password,
    required String confirmPassowrd,
    required String uuid,
  });
}
