import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/goves_and_district/data/models/goves_and_district_model.dart';
import 'package:workshopmanager/Feature/goves_and_district/data/source/base/goves_and_distric_source.dart';
import 'package:workshopmanager/Feature/goves_and_district/domain/repo/goves_and_district_repo.dart';

class GovesAndDistrictRepoImpl implements GovesAndDistrictRepo {
  final GovesAndDistricSource source;

  GovesAndDistrictRepoImpl(this.source);
  @override
  Future<Either<Failure, List<GovesAndDistrict>>> goves() async {
    try {
      final response = await source.goves();
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<GovesAndDistrict> goves = dataList
          .map(
              (json) => GovesAndDistrict.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(goves);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
