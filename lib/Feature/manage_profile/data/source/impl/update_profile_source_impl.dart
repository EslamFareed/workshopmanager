import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/manage_profile/data/source/base/update_profile_source.dart';

class UpdateProfileSourceImpl implements UpdateProfileSource {
  final BaseDio dio;

  UpdateProfileSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String companyName,
    required String method,
  }) async {
    FormData data = FormData.fromMap({
      "name": name,
      "phone": phone,
      "email": email,
      "company_name": companyName,
      "_method": method,
    });
    try {
      final response = await dio.post(
        EndPoints.updateProfile,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
