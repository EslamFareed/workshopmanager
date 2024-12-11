import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_model.dart';
import 'package:workshopmanager/Feature/Order_details/domain/order_details_repo.dart';
import 'package:workshopmanager/di.dart';

import '../../../../Core/constant/app_shared_pref_keys.dart';
import '../../../../Core/constant/end_points.dart';
import '../../../../Core/enum/order_status.dart';
import '../../../../Core/enum/service_state.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepo repo;
  OrderDetailsCubit(this.repo) : super(OrderDetailsInitial());

  final pendding = OrderStatus.pendding.name;
  final finished = OrderStatus.finished.name;
  final working = OrderStatus.working.name;
  final initial = ServiceState.initial.name;
  final servicePendding = ServiceState.pendding.name;

  final TextEditingController cancelController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  Future<void> orderDetails(int id) async {
    emit(OrderDetailsLoadingState());
    final result = await repo.orderDetails(id.toString());
    result.fold(
      (failure) => emit(OrderDetailsFailureState(failure.message)),
      (order) => emit(OrderDetailsSuccessState(order)),
    );
  }

  Future<void> cancelOrder(int id, String cancel) async {
    emit(LoadingCancelOrderState());
    try {
      var response = await Dio(BaseOptions(headers: {
        "Authorization":
            "Bearer ${preferences.getString(AppSharedPrefrencesKeys.tokenKey)}"
      })).post(
        "${EndPoints.baseUrl}${EndPoints.cancelOrder(id)}",
        data: FormData.fromMap(
          {
            "cancellation_reason": cancel,
            // "cancellation_reason": cancelController.text,
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(SuccessCancelOrderState());
      } else {
        emit(FailCancelOrderState());
      }
    } catch (e) {
      print(e.toString());
      emit(FailCancelOrderState());
    }
  }

  Future<void> finishOrder(int id) async {
    emit(LoadingFinishOrderState());
    try {
      var response = await Dio(BaseOptions(headers: {
        "Authorization":
            "Bearer ${preferences.getString(AppSharedPrefrencesKeys.tokenKey)}"
      })).post(
        "${EndPoints.baseUrl}${EndPoints.changeOrderStatus(id.toString())}",
        data: FormData.fromMap(
          {"status": "finished", "_method": "PUT"},
        ),
      );

      if (response.statusCode == 200) {
        emit(SuccessFinishOrderState());
      } else {
        emit(FailFinishOrderState());
      }
    } catch (e) {
      print(e.toString());
      emit(FailFinishOrderState());
    }
  }
// final result =
  //     await repo.cancelOrder(id, cancelOrder: cancelController.text);
  // result.fold(
  //   (failure) =>
  //       emit(CancelOrderFailureState(order, message: failure.message)),
  //   (order) => emit(CancelOrderSuccessState(order)),
  // );
  // Future<void> cancelService(String orderId, String serviceId) async {
  //   final OrderDetailsModel order = (state as OrderDetailsSuccessState).orders;
  //   final result = await repo.cancelService(orderId, serviceId);
  //   result.fold(
  //     (failure) => emit(CancelServiceFailureState(order, failure.message)),
  //     (order) => emit(CancelServiceSuccessState(order)),
  //   );
  // }
}
