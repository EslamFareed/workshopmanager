import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/show_manager_account/data/model/show_manager_info_model.dart';
import 'package:workshopmanager/Feature/show_manager_account/domain/repo/show_manager_repo.dart';

import '../source/base/show_manager_source.dart';

class ShowManagerRepoImpl implements ShowManagerRepo {
  final ShowManagerSource source;

  ShowManagerRepoImpl({required this.source});
  @override
  Future<Either<Failure, ShowManagerInfoModel>> showManager(String id) async {
    try {
      final response = await source.showManager(id);
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

      return Right(ShowManagerInfoModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShowManagerInfoModel>> updateManger(
    String id, {
    required String name,
    required String email,
    required String phone,
    required List workshopsId,
    required String password,
    required String confirmPassword,
    required String jobTitle,
    required String method,
  }) async {
    try {
      final response = await source.updateManager(
        id,
        name: name,
        email: email,
        phone: phone,
        workshopsId: workshopsId,
        password: password,
        confirmPassword: confirmPassword,
        jobTitle: jobTitle,
        method: method,
      );

      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      } else {
        return Right(ShowManagerInfoModel.fromJson(
            response['data'] as Map<String, dynamic>));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
