import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';

abstract class SettingRepo {
  Future<Either<Failure, String>> logout();
}
