abstract class OtpSource {
  Future<Map<String, dynamic>> otp({
    required String phone,
    required String otp,
  });
}
