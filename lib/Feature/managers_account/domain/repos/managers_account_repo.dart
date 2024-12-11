import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/managers_account/data/model/managers_account_employer_user.dart';

abstract class ManagersAccountRepo {
  Future<Either<Failure, List<ManagersAccountEmployerUser>>> getAllEmployer();
  Future<Either<Failure, String>> deleteEmployer(String id);
  Future<Either<Failure, String>> activeEmployer(
    String id, {
    required String method,
  });
}
