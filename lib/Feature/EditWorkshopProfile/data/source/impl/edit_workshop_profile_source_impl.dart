import 'dart:io';

import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/data/source/base/edit_workshop_profile_source.dart';

class EditWorkshopProfileSourceImpl implements EditWorkshopProfileSource {
  final BaseDio dio;

  EditWorkshopProfileSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> editWorkshop(
    String id, {
    required File logo,
    required String name,
    required String address,
    required String geoLat,
    required String geolng,
    required String phone,
    required String arDescritption,
    required String enDescritption,
    required String capacity,
    required String govesId,
    required String districId,
    required List brands,
    required List<Map<String, dynamic>> days,
    required String method,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "logo": await MultipartFile.fromFile(logo.path),
        "name": name,
        "address": address,
        "geo_lat": geoLat,
        "geo_lng": geolng,
        "phone_1": phone,
        "ar_description": arDescritption,
        "en_description": enDescritption,
        "orders_capacity": capacity,
        "gove_id": govesId,
        "dist_id": districId,
        "brand_ids[]": brands,
        "days": days,
        "_method": method,
      });
      final response = await dio.post(
        EndPoints.updateWorkshop(id),
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
