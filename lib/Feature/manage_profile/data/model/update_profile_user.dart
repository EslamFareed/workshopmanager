import 'package:equatable/equatable.dart';

import '../../../Auth/Login/data/models/profile_model.dart';

class User with EquatableMixin {
  int? id;
  String? avatar;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? phoneVerifiedAt;
  String? type;
  Profile? profile;

  User({
    this.id,
    this.avatar,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.phoneVerifiedAt,
    this.type,
    this.profile,
  });

  @override
  List<Object?> get props => [
        id,
        avatar,
        name,
        email,
        emailVerifiedAt,
        phone,
        phoneVerifiedAt,
        type,
        profile
      ];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      phone: json['phone'] as String?,
      phoneVerifiedAt: json['phone_verified_at'] as String?,
      type: json['type'] as String?,
      profile: json['profile'] == String
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }
}
