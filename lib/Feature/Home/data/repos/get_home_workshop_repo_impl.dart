import 'package:dartz/dartz.dart';

import 'package:workshopmanager/Core/network/error/failure.dart';

import 'package:workshopmanager/Feature/Home/data/model/home_workshop_model.dart';
import 'package:workshopmanager/Feature/Home/data/source/base/get_home_workshops_source.dart';

import '../../domian/repo/get_home_workshop_repo.dart';

class GetHomeWorkshopRepoImpl implements GetHomeWorkshopsRepo {
  final GetHomeWorkshopsSource source;

  GetHomeWorkshopRepoImpl(this.source);
  @override
  Future<Either<Failure, List<HomeWorkshopModel>>> getHomeWorkshops() async {
    try {
      final response = await source.getHomeWorkshops();
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<HomeWorkshopModel> services = dataList
          .map((json) =>
              HomeWorkshopModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(services);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, String>> deleteWorkshop(String id) async {
    try {
      final response = await source.deleteWorkshop(id);

      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
