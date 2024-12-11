import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/manage_workshop/data/source/base/manage_workshop_source.dart';
import 'package:workshopmanager/Feature/manage_workshop/domain/repo/manage_workshops_repo.dart';

class ManageWorkshopsRepoImpl implements ManageWorkshopsRepo {
  final ManageWorkshopSource source;

  ManageWorkshopsRepoImpl(this.source);
  @override
  Future<Either<Failure, String>> activeWorkshops(String id,
      {required String method}) async {
    try {
      final response = await source.activeWorkshops(
        id,
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

      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
