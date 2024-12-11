import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_model.dart';

abstract class WorkshopOrderRepo {
  Future<Either<Failure, List<WorkshopOrderModel>>> getWorkshopOrders(
      String id);
}
