import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/scanner_page/data/source/base/change_order_status_source.dart';
import '../../../../../Core/constant/end_points.dart';

class ChangeOrderStatusSourceImpl implements ChangeOrderStatusSource {
  final BaseDio _dio;

  ChangeOrderStatusSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> changeOrderStatus(
    String id, {
    required String status,
    required String lat,
    required String lng,
    required String method,
  }) async {
    FormData data = FormData.fromMap({
      "status": status,
      "client_latitude": lat,
      "client_longitude": lng,
      "_method": method
    });
    try {
      final response = await _dio.post(
        EndPoints.changeOrderStatus(id),
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
