import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/manage_profile/data/model/update_profile_model.dart';
import 'package:workshopmanager/Feature/manage_profile/data/source/base/update_profile_source.dart';
import 'package:workshopmanager/Feature/manage_profile/domain/repo/update_profile_repo.dart';

class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final UpdateProfileSource source;

  UpdateProfileRepoImpl(this.source);
  @override
  Future<Either<Failure, UpdateProfile>> updateProfile(
      {required String name,
      required String phone,
      required String email,
      required String companyName,
      required String method}) async {
    try {
      final response = await source.updateProfile(
        name: name,
        phone: phone,
        email: email,
        companyName: companyName,
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

      return Right(UpdateProfile.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
