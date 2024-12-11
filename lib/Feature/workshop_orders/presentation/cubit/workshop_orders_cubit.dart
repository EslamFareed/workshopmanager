import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workshopmanager/Core/utils/app_imgaes.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_model.dart';
import 'package:workshopmanager/Feature/workshop_orders/domain/repos/workshop_order_repo.dart';

part 'workshop_orders_state.dart';

class WorkshopOrdersCubit extends Cubit<WorkshopOrdersState> {
  final WorkshopOrderRepo repo;
  WorkshopOrdersCubit(this.repo) : super(WorkshopOrdersInitial());

  int currentIndex = 0;
  List<WorkshopOrderModel> orderList = [];
  List<WorkshopOrderModel> get orders => orderList;

  List<WorkshopOrderModel> filteredorders = [];

  final TextEditingController searchController = TextEditingController();

  List<String> title = [
    "طلبات جديدة",
    "طلبات قيد التشغيل",
    "الطلبات القديمة",
  ];
  List<String> vectors = [
    AppImages.newOrder,
    AppImages.pending,
    AppImages.finished
  ];

  Future<void> getWorkshopOrders(String id) async {
    emit(WorkshopOrdersLoadingState());

    final result = await repo.getWorkshopOrders(id);
    result.fold(
      (failure) {
        emit(WorkshopOrdersFailureState(failure.message));
      },
      (order) async {
        orderList.addAll(order);
        filteredorders = order;
        emit(WorkshopOrdersSuccessState(order));
      },
    );
  }

  void searchOrders(String query) {
    if (query.isEmpty) {
      filteredorders = orderList;
    } else {
      filteredorders = orderList.where((order) {
        final username = order.client!.user!.name?.toLowerCase() ?? '';
        final carName = order.car!.brand!.arName?.toLowerCase() ?? '';
        final date = order.reservationDate?.toLowerCase() ?? '';
        final type = order.car!.transmissionType?.toLowerCase() ?? '';
        final year = order.car!.modelYear?.toLowerCase() ?? '';
        final queryLower = query.toLowerCase();
        return username.contains(queryLower) ||
            carName.contains(queryLower) ||
            date.contains(queryLower) ||
            type.contains(queryLower) ||
            year.contains(queryLower);
      }).toList();
    }

    emit(WorkshopOrdersSuccessState(filteredorders));
  }
}
