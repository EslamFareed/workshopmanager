import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';

import '../base/about_workshop_source.dart';

class AboutWorkshopSourceImpl implements AboutWorkshopSource {
  final BaseDio dio;

  AboutWorkshopSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> showWorkshop(String id) async {
    try {
      final response = await dio.get(EndPoints.aboutWorkshop(id));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
