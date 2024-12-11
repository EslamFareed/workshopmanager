import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/managers_account/data/model/managers_account_workshops.dart';

class ManagersAccountEmployer with EquatableMixin {
  final int? id;
  final int? userId;
  final String? gender;
  final String? birthDate;
  final String? jobTitle;
  final List<ManagersAccountWorkshops>? workshops;

  const ManagersAccountEmployer({
    this.id,
    this.userId,
    this.gender,
    this.birthDate,
    this.workshops,
    this.jobTitle,
  });

  factory ManagersAccountEmployer.fromJson(Map<String, dynamic> json) {
    return ManagersAccountEmployer(
      jobTitle: json['job_title'] as String?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      gender: json['gender'] as String?,
      birthDate: json['birth_date'] as String?,
      workshops: json['workshops'] != null
          ? (json['workshops'] as List)
              .map((e) =>
                  ManagersAccountWorkshops.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  @override
  List<Object?> get props => [id, userId, gender, birthDate, workshops];
}
