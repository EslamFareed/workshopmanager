import 'package:dartz/dartz.dart';

import '../../../../Core/network/error/failure.dart';

abstract class ManageWorkshopsRepo {
  Future<Either<Failure, String>> activeWorkshops(
    String id, {
    required String method,
  });
}
