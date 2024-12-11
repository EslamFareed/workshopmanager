import 'package:equatable/equatable.dart';

import 'tokens_model.dart';
import 'user_model.dart';

class LoginModel with EquatableMixin {
  TokensModel? authorization;
  User? user;

  LoginModel({
    this.authorization,
    this.user,
  });

  @override
  List<Object?> get props => [authorization, user];

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      authorization: json['authorization'] == null
          ? null
          : TokensModel.fromJson(json['authorization'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}
