import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Feature/workshop_services/data/source/base/workshop_list_service_source.dart';
import '../../../../../Core/network/dio/base_dio.dart';

class WorkshopListServiceSourceImpl implements WorkshopListServiceSource {
  final BaseDio dio;

  WorkshopListServiceSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> workshopService() async {
    try {
      final response = await dio.get(
        EndPoints.service,
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
