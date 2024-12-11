import 'dart:io';

abstract class RegisterSource {
  Future<Map<String, dynamic>> register({
    required String name,
    required String phone,
    required String email,
    required String deviceName,
    required String password,
    required String confirmPassword,
    required String companyName,
    required String deviceId,
    required String deviceToken,
    required File taxImage,
    required File companyRegisteration,
  });
}
