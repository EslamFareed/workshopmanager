import 'package:equatable/equatable.dart';

class OtpModel with EquatableMixin {
  bool? success;
  String? message;
  String? uuid;

  OtpModel({
    this.success,
    this.message,
    this.uuid,
  });

  @override
  List<Object?> get props => [success, message, uuid];

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      uuid: json['uuid'] as String?,
    );
  }
}
