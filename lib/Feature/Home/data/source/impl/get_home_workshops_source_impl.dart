import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';

import '../base/get_home_workshops_source.dart';

class GetHomeWorkshopsSourceImpl implements GetHomeWorkshopsSource {
  final BaseDio dio;

  GetHomeWorkshopsSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> getHomeWorkshops() async {
    try {
      final response = await dio.get(EndPoints.workshops);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> deleteWorkshop(String id) async {
    try {
      final response = await dio.delete(
        EndPoints.deleteWokshop(id),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
