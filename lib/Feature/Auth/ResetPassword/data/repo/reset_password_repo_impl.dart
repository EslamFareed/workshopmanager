import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/data/source/base/reset_password_source.dart';
import 'package:workshopmanager/Feature/Auth/ResetPassword/domain/repos/reset_password_repo.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ResetPasswordSource source;

  ResetPasswordRepoImpl(this.source);
  @override
  Future<Either<Failure, String>> resetPassword({
    required String password,
    required String confirmPassowrd,
    required String uuid,
  }) async {
    try {
      final response = await source.resetPassword(
        confirmPassowrd: confirmPassowrd,
        password: password,
        uuid: uuid,
      );
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
        response['message'] as String,
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
