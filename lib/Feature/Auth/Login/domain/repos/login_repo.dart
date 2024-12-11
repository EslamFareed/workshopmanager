import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Feature/Auth/Login/data/models/login_model.dart';

import '../../../../../Core/network/error/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login({
    required String phone,
    required String password,
    required String deviceId,
    required String deviceToken,
    required String devicename,
  });
}
