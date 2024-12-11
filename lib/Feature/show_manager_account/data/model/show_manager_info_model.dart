import 'package:equatable/equatable.dart';

import 'show_manager_empl.dart';

class ShowManagerInfoModel with EquatableMixin {
  int? id;
  String? avatar;
  String? name;
  String? phone;
  String? email;
  int? isActive;
  String? type;
  Employer? employer;

  ShowManagerInfoModel({
    this.id,
    this.avatar,
    this.name,
    this.isActive,
    this.type,
    this.employer,
    this.phone,
    this.email,
  });

  @override
  List<Object?> get props => [
        id,
        avatar,
        name,
        isActive,
        type,
        employer,
        email,
        phone,
      ];

  factory ShowManagerInfoModel.fromJson(Map<String, dynamic> json) {
    return ShowManagerInfoModel(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      isActive: json['is_active'] as int?,
      type: json['type'] as String?,
      employer: json['employer'] == null
          ? null
          : Employer.fromJson(json['employer'] as Map<String, dynamic>),
    );
  }
}
