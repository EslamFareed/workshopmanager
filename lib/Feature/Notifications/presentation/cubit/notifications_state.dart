part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoadingState extends NotificationsState {}

final class NotificationsSuccessState extends NotificationsState {
  final List<NotficationsModel> notifications;

  const NotificationsSuccessState({required this.notifications});
}

final class NotificationsFailureState extends NotificationsState {
  final String message;

  const NotificationsFailureState({required this.message});
}

final class ChangeNotificationsStatusSuccessState
    extends NotificationsSuccessState {
  final String message;

  const ChangeNotificationsStatusSuccessState({
    required super.notifications,
    required this.message,
  });
}

final class ChangeNotificationsStatusFailureState
    extends NotificationsSuccessState {
  final String message;

  const ChangeNotificationsStatusFailureState({
    required super.notifications,
    required this.message,
  });
}

final class DeleteNotificationsSuccessState extends NotificationsSuccessState {
  final String message;

  const DeleteNotificationsSuccessState(
      {required super.notifications, required this.message});
}

final class DeleteNotificationsFailureState extends NotificationsSuccessState {
  final String message;

  const DeleteNotificationsFailureState(
      {required super.notifications, required this.message});
}
