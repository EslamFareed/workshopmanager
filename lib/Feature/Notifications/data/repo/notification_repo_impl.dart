import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';
import 'package:workshopmanager/Feature/Notifications/domain/repo/notification_repo.dart';
import '../model/notification_model.dart';
import '../source/base/notifications_source.dart';

class NotificationRepoImpl implements NotificationRepo {
  final NotificationsSource _source;

  NotificationRepoImpl(this._source);
  @override
  Future<Either<Failure, String>> changeNotificationStatus(String id) async {
    try {
      final response = await _source.changeNotificationStatus(id);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteNotification(String id) async {
    try {
      final response = await _source.deleteNotification(id);
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }
      return Right(response['message'] as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NotficationsModel>>> notifications() async {
    try {
      final response = await _source.notifications();
      if (!(response['success'] as bool)) {
        return Left(ServerFailure(response['message'] as String));
      }

      final List<dynamic> dataList = response['data'] as List<dynamic>;
      final List<NotficationsModel> notifcations = dataList
          .map((json) =>
              NotficationsModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return Right(notifcations);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
