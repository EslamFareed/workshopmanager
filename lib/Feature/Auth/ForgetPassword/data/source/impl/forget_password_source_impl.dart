import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';

import '../../../../../../Core/constant/end_points.dart';
import '../base/forget_password_soruce.dart';

class ForgetPasswordSourceImpl implements ForgetPasswordSource {
  final BaseDio dio;

  ForgetPasswordSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> forgetPassword({required String phone}) async {
    FormData data = FormData.fromMap({
      "phone": phone,
    });

    try {
      final response = await dio.post(EndPoints.forgetPaswword, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
