import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/managers_account/data/model/managers_account_employer.dart';

class ManagersAccountEmployerUser with EquatableMixin {
  final int? id;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? name;
  final int? isActive;
  final ManagersAccountEmployer? employer;

  const ManagersAccountEmployerUser({
    this.id,
    this.avatar,
    this.name,
    this.isActive,
    this.employer,
    this.email,
    this.phone,
  });

  factory ManagersAccountEmployerUser.fromJson(Map<String, dynamic> json) {
    return ManagersAccountEmployerUser(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      isActive: json['is_active'] as int?,
      employer: json['employer'] != null
          ? ManagersAccountEmployer.fromJson(
              json['employer'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, avatar, name, isActive, employer];
}
