import 'dart:io';

abstract class EditWorkshopProfileSource {
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
    required List<dynamic> brands,
    required List<Map<String, dynamic>> days,
    required String method,
  });
}
