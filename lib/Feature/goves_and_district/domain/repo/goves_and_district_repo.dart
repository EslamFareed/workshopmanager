import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Feature/goves_and_district/data/models/goves_and_district_model.dart';
import '../../../../Core/network/error/failure.dart';

abstract class GovesAndDistrictRepo {
  Future<Either<Failure, List<GovesAndDistrict>>> goves();
}
