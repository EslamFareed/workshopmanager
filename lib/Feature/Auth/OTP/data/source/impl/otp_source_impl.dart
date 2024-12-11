import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';

import '../../../../../../Core/constant/end_points.dart';
import '../base/otp_source.dart';

class OtpSourceImpl implements OtpSource {
  final BaseDio dio;

  OtpSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> otp({
    required String phone,
    required String otp,
  }) async {
    FormData data = FormData.fromMap({
      "phone": phone,
      "code": otp,
    });
    try {
      final response = await dio.post(EndPoints.otp, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
