import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/Auth/OTP/data/model/otp_model.dart';
import 'package:workshopmanager/Feature/Auth/OTP/domain/repos/otp_repo.dart';
import '../source/base/otp_source.dart';

class OtpRepoImpl implements OtpRepo {
  final OtpSource source;

  OtpRepoImpl(this.source);
  @override
  Future<Either<Failure, OtpModel>> otp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await source.otp(
        phone: phone,
        otp: otp,
      );
      if (!(response['success'] as bool)) {
        // Check if there are specific errors in the "errors" field
        if (response.containsKey('errors')) {
          final Map<String, dynamic> errors =
              response['errors'] as Map<String, dynamic>;

          // Concatenate all the error messages into a single string
          String errorMessage = '';
          errors.forEach((key, value) {
            if (value is List) {
              for (var error in value) {
                errorMessage += "$error\n"; // Appending each error message
              }
            }
          });

          return Left(ServerFailure(
              errorMessage.trim())); // Return all concatenated errors
        }
        return Left(ServerFailure(response['message'] as String));
      }

      return Right(OtpModel.fromJson(response));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
