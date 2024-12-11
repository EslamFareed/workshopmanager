import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_model.dart';
import 'package:workshopmanager/Feature/Order_details/data/source/base/order_details_source.dart';
import 'package:workshopmanager/Feature/Order_details/domain/order_details_repo.dart';

class OrderDetailsRepoImpl implements OrderDetailsRepo {
  final OrderDetailsSource source;

  OrderDetailsRepoImpl(this.source);
  @override
  Future<Either<Failure, OrderDetailsModel>> orderDetails(String id) async {
    try {
      final response = await source.orderDetails(id);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
          OrderDetailsModel.fromJson(response['data'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderDetailsModel>> cancelOrder(
    String id, {
    required String cancelOrder,
  }) async {
    try {
      final response = await source.orderDetails(id);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(
          OrderDetailsModel.fromJson(response['data'] as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  //@override
  // Future<Either<Failure, OrderDetailsModel>> cancelService(
  //     String orderId, String serviceId) async {
  //   try {
  //     final response = await source.cancelService(orderId, serviceId);
  //     if (!(response['success'] as bool)) {
  //       return Left(ServerFailure(response['message'] as String));
  //     }
  //     return Right(
  //         OrderDetailsModel.fromJson(response['data'] as Map<String, dynamic>));
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }
}
