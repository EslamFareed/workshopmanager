import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/managers_account/data/model/managers_account_employer_user.dart';
import 'package:workshopmanager/Feature/managers_account/domain/repos/managers_account_repo.dart';
import '../source/base/managers_account_source.dart';

class ManagersAccountRepoImpl implements ManagersAccountRepo {
  final ManagersAccountSource source;

  ManagersAccountRepoImpl(this.source);
  @override
  Future<Either<Failure, List<ManagersAccountEmployerUser>>>
      getAllEmployer() async {
    try {
      final response = await source.getAllEmployer();
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

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<ManagersAccountEmployerUser> managers = dataList
          .map((json) => ManagersAccountEmployerUser.fromJson(
              json as Map<String, dynamic>))
          .toList();

      return Right(managers);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, String>> deleteEmployer(String id) async {
    try {
      final response = await source.deleteEmployer(id);

      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> activeEmployer(
    String id, {
    required String method,
  }) async {
    try {
      final reponse = await source.activeEmployer(id, method: method);
      if (!(reponse['success'] as bool)) {
        return Left(ServerFailure(reponse['message'] as String));
      } else {
        return Right(reponse['message'] as String);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
