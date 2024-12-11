import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/workshop_services/domian/repo/workshop_list_service_repo.dart';
import '../model/workshop_list_service.dart';
import '../source/base/workshop_list_service_source.dart';

class WorkshopListServiceRepoImpl implements WorkshopListServiceRepo {
  final WorkshopListServiceSource source;

  WorkshopListServiceRepoImpl(this.source);
  @override
  Future<Either<Failure, List<WorkshopListService>>> workshopservice() async {
    try {
      final response = await source.workshopService();
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<WorkshopListService> services = dataList
          .map((json) =>
              WorkshopListService.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(services);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
