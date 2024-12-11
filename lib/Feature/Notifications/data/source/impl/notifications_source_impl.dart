import 'package:dio/dio.dart';
import 'package:workshopmanager/Core/constant/end_points.dart';
import 'package:workshopmanager/Core/network/dio/base_dio.dart';
import 'package:workshopmanager/Feature/Notifications/data/source/base/notifications_source.dart';

class NotificationsSourceImpl implements NotificationsSource {
  final BaseDio _dio;

  NotificationsSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> changeNotificationStatus(String id) async {
    FormData data = FormData.fromMap({
      "status": "read",
      "_method": "PUT",
    });
    try {
      final reposnse = await _dio.post(
        EndPoints.changeNotificationState(id),
        data: data,
      );

      return reposnse.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> deleteNotification(String id) async {
    FormData data = FormData.fromMap({
      "status": "read",
      "_method": "PUT",
    });
    final reposnse = await _dio.delete(
      EndPoints.deleteNotification(id),
      data: data,
    );

    return reposnse.data;
  }

  @override
  Future<Map<String, dynamic>> notifications() async {
    try {
      final reposnse = await _dio.get(EndPoints.notification);
      return reposnse.data;
    } catch (e) {
      rethrow;
    }
  }
}
