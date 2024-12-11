import 'package:equatable/equatable.dart';

import 'show_manager_workshops.dart';

class Employer with EquatableMixin {
  int? id;
  String? createdAt;
  int? userId;
  String? jobTitle;
  String? gender;
  String? bithDate;
  List<Workshops>? workshops;

  Employer({
    this.id,
    this.createdAt,
    this.userId,
    this.jobTitle,
    this.gender,
    this.bithDate,
    this.workshops,
  });

  @override
  List<Object?> get props =>
      [id, createdAt, userId, jobTitle, gender, bithDate, workshops];

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      userId: json['user_id'] as int?,
      jobTitle: json['job_title'] as String?,
      gender: json['gender'] as String?,
      bithDate: json['bith_date'] as String?,
      workshops: (json['workshops'] as List<dynamic>?)
          ?.map((e) => Workshops.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
