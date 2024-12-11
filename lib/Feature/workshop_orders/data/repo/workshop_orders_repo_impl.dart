import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_model.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/source/base/workshop_order_source.dart';
import 'package:workshopmanager/Feature/workshop_orders/domain/repos/workshop_order_repo.dart';

class WorkshopOrdersRepoImpl implements WorkshopOrderRepo {
  final WorkshopOrderSource source;

  WorkshopOrdersRepoImpl(this.source);
  @override
  Future<Either<Failure, List<WorkshopOrderModel>>> getWorkshopOrders(
      String id) async {
    try {
      final response = await source.getWorkshopOrders(id);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<WorkshopOrderModel> orders = dataList
          .map((json) =>
              WorkshopOrderModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return Right(orders);
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
