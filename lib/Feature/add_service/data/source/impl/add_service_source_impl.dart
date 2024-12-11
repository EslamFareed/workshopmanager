import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/add_service/data/source/base/add_service_source.dart';

import '../../../../../Core/constant/end_points.dart';

class AddServiceSourceImpl implements AddServiceSource {
  final BaseDio dio;

  AddServiceSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> addService(
    String id, {
    required String serviceId,
    required String time,
    required String cost,
    required String timeType,
  }) async {
    try {
      final response = await dio.post(
        EndPoints.addService(id),
        data: {
          "service_id": serviceId,
          "price": cost,
          "astimated_time": time,
          "astimated_time_type": timeType,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> activeService(String id) async {
    try {
      final response = await dio.put(EndPoints.activeService(id));

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
