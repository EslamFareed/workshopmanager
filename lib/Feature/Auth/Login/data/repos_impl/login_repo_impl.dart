import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/Auth/Login/data/models/login_model.dart';
import 'package:workshopmanager/Feature/Auth/Login/domain/repos/login_repo.dart';

import '../source/login_source.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginSource loginSource;

  LoginRepoImpl(this.loginSource);
  @override
  Future<Either<Failure, LoginModel>> login({
    required String phone,
    required String password,
    required String deviceId,
    required String deviceToken,
    required String devicename,
  }) async {
    try {
      final response = await loginSource.login(
          phone: phone,
          password: password,
          deviceId: deviceId,
          deviceToken: deviceToken,
          devicename: devicename);
      if (!(response['success'] as bool)) {
        if (response.containsKey('errors')) {
          return Left(ServerFailure(response['errors']['phone'][0] as String));
        }
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(LoginModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
