import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/get_service/service_model.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_model.dart';
import 'package:workshopmanager/Feature/suggested_service/data/source/base/service_source.dart';
import 'package:workshopmanager/Feature/suggested_service/domain/repo/service_repo.dart';

class ServiceRepoImpl implements ServiceRepo {
  final ServiceSource source;

  ServiceRepoImpl(this.source);
  @override
  Future<Either<Failure, List<ServiceModel>>> service(String id) async {
    try {
      final response = await source.service(id);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['msg'] as String));
      }

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<ServiceModel> service = dataList
          .map((json) => ServiceModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(service);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, SuggestedServiceModel>> suggestedService(
    String id, {
    required List brandList,
  }) async {
    try {
      final response = await source.suggestedService(id, brandList: brandList);
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

      return Right(SuggestedServiceModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
