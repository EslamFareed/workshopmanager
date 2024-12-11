import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, String>> forgetPassword({
    required String phone,
  });
}
