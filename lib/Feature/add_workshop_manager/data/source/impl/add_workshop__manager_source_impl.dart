import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/data/source/base/add_workshop_manager_source.dart';

class AddWorkshopManagerSourceImpl implements AddWorkshopManagerSource {
  final BaseDio dio;

  AddWorkshopManagerSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> addWorkshopManager({
    required String jobTitle,
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required List workshopsId,
  }) async {
    final FormData data = FormData.fromMap({
      "name": name,
      "phone": phone,
      "email": email,
      "workshop_ids[]": workshopsId,
      "password": password,
      "password_confirmation": confirmPassword,
      "job_title": jobTitle
    });
    try {
      final response = await dio.post(EndPoints.addWorkshopManager, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
