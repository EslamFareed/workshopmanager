import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/suggested_service/data/source/base/service_source.dart';

class ServiceSourceImpl implements ServiceSource {
  final BaseDio dio;

  ServiceSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> service(String id) async {
    try {
      final response = await dio.get(EndPoints.services(id));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> suggestedService(
    String id, {
    required List brandList,
  }) async {
    FormData data = FormData.fromMap({
      "service_ids[]": brandList,
    });
    try {
      final response =
          await dio.post(EndPoints.suggestedService(id), data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
