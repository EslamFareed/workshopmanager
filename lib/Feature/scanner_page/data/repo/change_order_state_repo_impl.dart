import 'package:dartz/dartz.dart';

import 'package:workshopmanager/Core/network/error/failure.dart';

import 'package:workshopmanager/Feature/Order_details/data/models/order_details_model.dart';
import 'package:workshopmanager/Feature/scanner_page/data/source/base/change_order_status_source.dart';

import '../../domain/change_order_status_repo.dart';

class ChangeOrderStateRepoImpl implements ChangeOrderStatusRepo {
  final ChangeOrderStatusSource _source;

  ChangeOrderStateRepoImpl(this._source);
  @override
  Future<Either<Failure, OrderDetailsModel>> changeOrderStatus(String id,
      {required String status,
      required String lat,
      required String lng,
      required String method}) async {
    try {
      final response = await _source.changeOrderStatus(
        id,
        status: status,
        lat: lat,
        lng: lng,
        method: method,
      );
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

      return Right(OrderDetailsModel.fromJson(response['data']));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
