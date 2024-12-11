import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/show_manager_account/data/source/base/show_manager_source.dart';

class ShowManagerSourceImpl implements ShowManagerSource {
  final BaseDio dio;

  ShowManagerSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> showManager(String id) async {
    try {
      final response = await dio.get(EndPoints.showManager(id));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateManager(
    String id, {
    required String name,
    required String email,
    required String phone,
    required List workshopsId,
    required String password,
    required String confirmPassword,
    required String jobTitle,
    required String method,
  }) async {
    FormData data = FormData.fromMap({
      "name": name,
      "phone": phone,
      "email": email,
      "workshop_ids[]": workshopsId,
      "password": password,
      "password_confirmation": confirmPassword,
      "job_title": jobTitle,
      "_method": method
    });
    try {
      final response = await dio.post(EndPoints.updateManager(id), data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
