import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';

import '../../../../../../Core/network/dio/base_dio.dart';
import '../base/reset_password_source.dart';

class ResetPasswordSourceImpl implements ResetPasswordSource {
  final BaseDio dio;

  ResetPasswordSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> resetPassword({
    required String password,
    required String confirmPassowrd,
    required String uuid,
  }) async {
    FormData data = FormData.fromMap({
      "password": password,
      "password_confirmation": confirmPassowrd,
      "uuid": uuid,
    });
    try {
      final response = await dio.post(EndPoints.resetPassword, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
