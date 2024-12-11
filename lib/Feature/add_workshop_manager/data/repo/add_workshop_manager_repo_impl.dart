import 'package:dartz/dartz.dart';

import 'package:workshopmanager/Core/network/error/failure.dart';

import 'package:workshopmanager/Feature/add_workshop_manager/data/model/add_workshop_manager_model.dart';

import '../../domain/add_workshop_manager_repo.dart';
import '../source/base/add_workshop_manager_source.dart';

class AddWorkshopManagerRepoImpl implements AddWorkshopManagerRepo {
  final AddWorkshopManagerSource source;

  AddWorkshopManagerRepoImpl(this.source);
  @override
  Future<Either<Failure, AddWorkshopManagerModel>> addWorkshopManager({
    required String jobTitle,
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required List workshopsId,
  }) async {
    try {
      final response = await source.addWorkshopManager(
          jobTitle: jobTitle,
          name: name,
          phone: phone,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          workshopsId: workshopsId);
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

      return Right(AddWorkshopManagerModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
