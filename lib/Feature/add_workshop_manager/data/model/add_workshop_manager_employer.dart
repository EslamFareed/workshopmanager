import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/data/model/add_workshop_manager_workshops.dart';

class AddWorkshopManagerEmployer with EquatableMixin {
  int? id;
  String? createdAt;
  int? userId;
  String? jobTitle;
  String? gender;
  String? bithDate;
  List<AddWorkshopManagerWorkshops>? workshops;

  AddWorkshopManagerEmployer({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.jobTitle,
    required this.gender,
    required this.bithDate,
    required this.workshops,
  });

  @override
  List<Object?> get props =>
      [id, createdAt, userId, jobTitle, gender, bithDate, workshops];

  factory AddWorkshopManagerEmployer.fromJson(Map<String, dynamic> json) {
    return AddWorkshopManagerEmployer(
      id: json['id'] as int,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as int?,
      jobTitle: json['job_title'] as String?,
      gender: json['gender'],
      bithDate: json['bith_date'],
      workshops: (json['workshops'] as List<dynamic>?)!
          .map((e) =>
              AddWorkshopManagerWorkshops.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
