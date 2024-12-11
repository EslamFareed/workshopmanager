import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/Notifications/domain/repo/notification_repo.dart';
import '../../data/model/notification_model.dart';
part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationRepo _repo;
  NotificationsCubit(this._repo) : super(NotificationsInitial());

  Future<void> notification() async {
    final result = await _repo.notifications();
    result.fold(
      (failure) => emit(NotificationsFailureState(message: failure.message)),
      (notifications) =>
          emit(NotificationsSuccessState(notifications: notifications)),
    );
  }

  Future<void> changeNotificationStatus(String id) async {
    final List<NotficationsModel> notification =
        (state as NotificationsSuccessState).notifications;

    final result = await _repo.changeNotificationStatus(id);
    result.fold(
        (failure) => emit(ChangeNotificationsStatusSuccessState(
              notifications: notification,
              message: failure.message,
            )),
        (success) => emit(ChangeNotificationsStatusSuccessState(
              message: success,
              notifications: notification,
            )));
  }

  Future<void> deleteNotification(String id) async {
    final List<NotficationsModel> notification =
        (state as NotificationsSuccessState).notifications;

    final result = await _repo.deleteNotification(id);
    result.fold(
      (failure) => emit(
        DeleteNotificationsSuccessState(
          notifications: notification,
          message: failure.message,
        ),
      ),
      (success) => emit(
        DeleteNotificationsSuccessState(
          message: success,
          notifications: notification,
        ),
      ),
    );
  }
}
