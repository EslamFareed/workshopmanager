import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Feature/Auth/Login/data/source/login_source.dart';
import '../../../../../Core/network/dio/base_dio.dart';

class LoginSourceImpl implements LoginSource {
  final BaseDio dio;

  LoginSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
    required String deviceId,
    required String deviceToken,
    required String devicename,
  }) async {
    FormData data = FormData.fromMap({
      "phone": phone,
      "password": password,
      "device_id": deviceId,
      "device_token": deviceToken,
      "device_name": devicename,
    });
    try {
      final response = await dio.post(EndPoints.login, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
