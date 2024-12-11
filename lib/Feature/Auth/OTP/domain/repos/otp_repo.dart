import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Feature/Auth/OTP/data/model/otp_model.dart';

import '../../../../../Core/network/error/failure.dart';

abstract class OtpRepo {
  Future<Either<Failure, OtpModel>> otp({
    required String phone,
    required String otp,
  });
}
