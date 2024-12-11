import 'package:dartz/dartz.dart';

import '../../../Core/network/error/failure.dart';
import '../../Order_details/data/models/order_details_model.dart';

abstract class ChangeOrderStatusRepo {
  Future<Either<Failure, OrderDetailsModel>> changeOrderStatus(
    String id, {
    required String status,
    required String lat,
    required String lng,
    required String method,
  });
}
