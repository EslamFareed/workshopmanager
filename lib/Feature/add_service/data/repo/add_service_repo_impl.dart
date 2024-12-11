import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/add_service/data/model/add_service_model.dart';
import 'package:workshopmanager/Feature/add_service/domain/repo/add_service_repo.dart';

import '../source/base/add_service_source.dart';

class AddServiceRepoImpl implements AddServiceRepo {
  final AddServiceSource source;

  AddServiceRepoImpl(this.source);
  @override
  Future<Either<Failure, AddServiceModel>> addSerivce(
    String id, {
    required String serviceId,
    required String time,
    required String cost,
    required String timeType,
  }) async {
    try {
      final response = await source.addService(
        id,
        time: time,
        cost: cost,
        timeType: timeType,
        serviceId: serviceId,
      );

      if (!(response["success"] as bool)) {
        return Left(ServerFailure(response["message"] as String));
      }

      return Right(AddServiceModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> activeService(String id) async {
    try {
      final response = await source.activeService(id);

      if (!(response["success"] as bool)) {
        return Left(ServerFailure(response["msg"] as String));
      } else {
        return Right(response["msg"] as String);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
