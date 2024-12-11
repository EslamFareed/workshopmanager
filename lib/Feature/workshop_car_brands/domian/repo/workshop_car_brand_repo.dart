import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/data/model/workshop_car_brands_model.dart';

abstract class WorkshopCarBrandRepo {
  Future<Either<Failure, List<WorkshopCarBrand>>> workshopBrand();
}
