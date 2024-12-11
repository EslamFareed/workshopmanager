part of 'workshop_orders_cubit.dart';

sealed class WorkshopOrdersState extends Equatable {
  @override
  List<Object> get props => [];
}

final class WorkshopOrdersInitial extends WorkshopOrdersState {}

final class WorkshopOrdersLoadingState extends WorkshopOrdersState {}

final class WorkshopOrdersSuccessState extends WorkshopOrdersState {
  final List<WorkshopOrderModel> order;

  @override
  List<Object> get props => [order];

  WorkshopOrdersSuccessState(this.order);
}

final class WorkshopOrdersFailureState extends WorkshopOrdersState {
  final String message;

  WorkshopOrdersFailureState(this.message);
}
