part of 'order_details_cubit.dart';

sealed class OrderDetailsState extends Equatable {
  const OrderDetailsState();

  @override
  List<Object> get props => [];
}


final class LoadingFinishOrderState extends OrderDetailsState {}
final class SuccessFinishOrderState extends OrderDetailsState {}
final class FailFinishOrderState extends OrderDetailsState {}


final class LoadingCancelOrderState extends OrderDetailsState {}
final class SuccessCancelOrderState extends OrderDetailsState {}
final class FailCancelOrderState extends OrderDetailsState {}


final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsLoadingState extends OrderDetailsState {}

final class OrderDetailsSuccessState extends OrderDetailsState {
  final OrderDetailsModel orders;

  const OrderDetailsSuccessState(this.orders);
  @override
  List<Object> get props => [orders];
}

final class OrderDetailsFailureState extends OrderDetailsState {
  final String message;

  const OrderDetailsFailureState(this.message);
  @override
  List<Object> get props => [message];
}

final class CancelOrderFailureState extends OrderDetailsSuccessState {
  final String message;

  const CancelOrderFailureState(super.orders, {required this.message});
}

final class CancelOrderSuccessState extends OrderDetailsSuccessState {
  const CancelOrderSuccessState(super.orders);
}

final class CancelServiceFailureState extends OrderDetailsSuccessState {
  final String message;
  const CancelServiceFailureState(super.orders, this.message);
}

final class CancelServiceSuccessState extends OrderDetailsSuccessState {
  const CancelServiceSuccessState(super.orders);
}
