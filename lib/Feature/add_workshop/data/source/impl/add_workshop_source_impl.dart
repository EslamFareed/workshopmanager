import 'dart:io';

import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Feature/add_workshop/data/source/base/add_workshop_source.dart';

import '../../../../../Core/network/dio/base_dio.dart';

class AddWorkshopSourceImpl implements AddWorkshopSource {
  final BaseDio dio;

  AddWorkshopSourceImpl(this.dio);
  @override
  Future<Map<String, dynamic>> addWorkshop({
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
    required List<dynamic> brands,
    required List<Map<String, dynamic>> days,
    required List<File> images,
  }) async {
    List<MultipartFile> imageFiles = await Future.wait(
      images.map((image) async {
        return await MultipartFile.fromFile(image.path);
      }).toList(),
    );
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
      "images[]": imageFiles,
    });

    try {
      final response = await dio.post(
        EndPoints.addWorkshop,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
