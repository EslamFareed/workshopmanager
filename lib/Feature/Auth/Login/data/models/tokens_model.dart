import 'package:equatable/equatable.dart';

class TokensModel with EquatableMixin {
  String? token;
  String? refreshToken;

  TokensModel({
    this.token,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [token, refreshToken];

  factory TokensModel.fromJson(Map<String, dynamic> json) {
    return TokensModel(
      token: json['token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );
  }
}
