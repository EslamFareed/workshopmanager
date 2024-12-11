import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/manage_workshop/data/source/base/manage_workshop_source.dart';

class ManageWorkshopSourceImpl implements ManageWorkshopSource {
  final BaseDio dio;

  ManageWorkshopSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> activeWorkshops(String id,
      {required String method}) async {
    FormData data = FormData.fromMap({
      "_method": method,
    });
    try {
      final response =
          await dio.post(EndPoints.activeWorkshops(id), data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
