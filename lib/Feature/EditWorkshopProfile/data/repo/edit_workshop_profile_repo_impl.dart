import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/data/source/base/edit_workshop_profile_source.dart';
import 'package:workshopmanager/Feature/EditWorkshopProfile/domain/repo/edit_workshop_profile_repo.dart';
import 'package:workshopmanager/Feature/add_workshop/data/model/workshop_model.dart';

class EditWorkshopProfileRepoImpl implements EditWorkshopProfileRepo {
  final EditWorkshopProfileSource source;

  EditWorkshopProfileRepoImpl(this.source);
  @override
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
    required List brands,
    required List<Map<String, dynamic>> days,
    required String method,
  }) async {
    try {
      final response = await source.editWorkshop(
        id,
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
        method: method,
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
