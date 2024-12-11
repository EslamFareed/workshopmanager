import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/get_service/service_model.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_model.dart';

abstract class ServiceRepo {
  Future<Either<Failure, List<ServiceModel>>> service(String id);
  Future<Either<Failure, SuggestedServiceModel>> suggestedService(
    String id, {
    required List brandList,
  });
}
