import 'package:equatable/equatable.dart';

import '../../../Auth/Login/data/models/user_model.dart';

class UpdateProfile with EquatableMixin {
  User? user;

  UpdateProfile({
    this.user,
  });

  @override
  List<Object?> get props => [user];

  factory UpdateProfile.fromJson(Map<String, dynamic> json) {
    return UpdateProfile(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
