import 'package:workshopmanager/Core/constant/end_points.dart';

import '../../../../../Core/network/dio/base_dio.dart';
import '../base/setting_source.dart';

class SettingSourceImpl implements SettingSource {
  final BaseDio dio;

  SettingSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> logout() async {
    try {
      final response = await dio.post(EndPoints.logout);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
