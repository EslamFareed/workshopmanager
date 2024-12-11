import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';

import '../../../add_workshop/data/model/workshop_model.dart';

abstract class EditWorkshopProfileRepo {
  Future<Either<Failure, WorkshopModel>> editWorkshop(
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
