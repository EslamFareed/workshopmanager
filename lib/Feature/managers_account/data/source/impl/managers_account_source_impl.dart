import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/managers_account/data/source/base/managers_account_source.dart';

class ManagersAccountSourceImpl implements ManagersAccountSource {
  final BaseDio dio;

  ManagersAccountSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> getAllEmployer() async {
    try {
      final response = await dio.get(EndPoints.managers);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> deleteEmployer(String id) async {
    try {
      final response = await dio.delete(EndPoints.deleteManager(id));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> activeEmployer(
    String id, {
    required String method,
  }) async {
    FormData data = FormData.fromMap({
      '_method': method,
    });
    try {
      final response = await dio.post(
        EndPoints.activeEmployer(id),
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
