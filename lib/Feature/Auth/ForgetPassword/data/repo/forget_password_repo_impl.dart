import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/Auth/ForgetPassword/data/source/base/forget_password_soruce.dart';

import '../../domain/repos/forget_password_repo.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordSource source;

  ForgetPasswordRepoImpl(this.source);
  @override
  Future<Either<Failure, String>> forgetPassword({
    required String phone,
  }) async {
    try {
      final response = await source.forgetPassword(
        phone: phone,
      );
      if (!(response['success'] as bool)) {
        if (response.containsKey('errors')) {
          return Left(ServerFailure(response['errors']['phone'][0] as String));
        }
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
