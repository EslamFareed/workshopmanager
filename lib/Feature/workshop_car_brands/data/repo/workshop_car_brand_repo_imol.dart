import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/data/model/workshop_car_brands_model.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/data/source/base/workshop_car_brand_source.dart';
import 'package:workshopmanager/Feature/workshop_car_brands/domian/repo/workshop_car_brand_repo.dart';

class WorkshopCarBrandRepoImol implements WorkshopCarBrandRepo {
  final WorkshopCarBrandSource source;

  WorkshopCarBrandRepoImol(this.source);
  @override
  Future<Either<Failure, List<WorkshopCarBrand>>> workshopBrand() async {
    try {
      final response = await source.workshopBrand();
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<WorkshopCarBrand> services = dataList
          .map(
              (json) => WorkshopCarBrand.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(services);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
