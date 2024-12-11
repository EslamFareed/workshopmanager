import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/add_workshop/data/model/workshop_model.dart';
import 'package:workshopmanager/Feature/add_workshop/data/source/base/add_workshop_source.dart';
import 'package:workshopmanager/Feature/add_workshop/domain/respo/add_workshop_repo.dart';

class AddWorkshopRepoImol implements AddWorkshopRepo {
  final AddWorkshopSource source;

  AddWorkshopRepoImol(this.source);
  @override
  Future<Either<Failure, WorkshopModel>> addWorkshop({
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
    required List<File> images,
  }) async {
    try {
      final response = await source.addWorkshop(
        logo: logo,
        name: name,
        address: address,
        geoLat: geoLat,
        geolng: geolng,
        phone: phone,
        arDescritption: arDescritption,
        enDescritption: enDescritption,
        capacity: capacity,
        govesId: govesId,
        districId: districId,
        brands: brands,
        days: days,
        images: images,
      );
      if (!(response['success'] as bool)) {
        if (response.containsKey('errors')) {
          final Map<String, dynamic> errors =
              response['errors'] as Map<String, dynamic>;

          String errorMessage = '';
          errors.forEach((key, value) {
            if (value is List) {
              for (var error in value) {
                errorMessage += "$error\n";
              }
            }
          });

          return Left(ServerFailure(errorMessage.trim()));
        }
        return Left(ServerFailure(response['message'] as String));
      }

      return Right(WorkshopModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
