import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/Order_details/data/source/base/order_details_source.dart';

class OrderDetailsSourceImpl implements OrderDetailsSource {
  final BaseDio dio;

  OrderDetailsSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> orderDetails(String id) async {
    try {
      final response = await dio.get(EndPoints.orderDetails(id));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> cancelOrder(
    int id, {
    required String cancelOrder,
  }) async {
    FormData data = FormData.fromMap({
      "cancellation_reason": cancelOrder,
    });
    try {
      final response = await dio.post(EndPoints.cancelOrder(id), data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<Map<String, dynamic>> cancelService(
  //     String orderId, String serviceId) async {
  //   try {
  //     final response =
  //         await dio.put(EndPoints.cancelService(orderId, serviceId));
  //     return response.data;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
