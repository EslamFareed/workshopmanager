import 'package:dartz/dartz.dart';
import 'package:workshopmanager/Core/network/error/failure.dart';

import '../../data/model/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotficationsModel>>> notifications();
  Future<Either<Failure, String>> changeNotificationStatus(String id);
  Future<Either<Failure, String>> deleteNotification(String id);
}
