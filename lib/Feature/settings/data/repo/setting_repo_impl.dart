import 'package:dartz/dartz.dart';

import 'package:workshopmanager/Core/network/error/failure.dart';

import '../../domain/repo/setting_repo.dart';
import '../source/base/setting_source.dart';

class SettingRepoImpl implements SettingRepo {
  final SettingSource source;

  SettingRepoImpl(this.source);
  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final response = await source.logout();

      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
