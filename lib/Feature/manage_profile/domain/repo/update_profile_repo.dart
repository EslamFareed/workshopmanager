import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';

import '../../data/model/update_profile_model.dart';

abstract class UpdateProfileRepo {
  Future<Either<Failure, UpdateProfile>> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String companyName,
    required String method,
  });
}
