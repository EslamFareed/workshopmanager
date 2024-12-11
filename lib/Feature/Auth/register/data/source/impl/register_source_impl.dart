import 'dart:io';

import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/Auth/register/data/source/base/register_source.dart';

class RegisterSourceImpl implements RegisterSource {
  final BaseDio dio;

  RegisterSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> register(
      {required String name,
      required String phone,
      required String email,
      required String deviceName,
      required String password,
      required String confirmPassword,
      required String companyName,
      required String deviceId,
      required String deviceToken,
      required File taxImage,
      required File companyRegisteration}) async {
    FormData data = FormData.fromMap({
      "name": name,
      "phone": phone,
      "email": email,
      "device_name": deviceName,
      "password": password,
      "password_confirmation": confirmPassword,
      "company_name": companyName,
      "device_id": deviceId,
      "device_token": deviceToken,
      "tax_card": await MultipartFile.fromFile(taxImage.path),
      "company_registeration":
          await MultipartFile.fromFile(companyRegisteration.path),
    });
    try {
      final response = await dio.post(
        EndPoints.register,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
