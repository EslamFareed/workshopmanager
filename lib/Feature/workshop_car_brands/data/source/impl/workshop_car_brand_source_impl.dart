import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/data/source/base/workshop_car_brand_source.dart';

class WorkshopCarBrandSourceImpl implements WorkshopCarBrandSource {
  final BaseDio dio;

  WorkshopCarBrandSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> workshopBrand() async {
    try {
      final response = await dio.get(EndPoints.brands);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
