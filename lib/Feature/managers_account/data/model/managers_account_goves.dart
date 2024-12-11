import 'package:equatable/equatable.dart';

class ManagersAccountGoves with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const ManagersAccountGoves({
    this.id,
    this.arName,
    this.enName,
  });

  factory ManagersAccountGoves.fromJson(Map<String, dynamic> json) {
    return ManagersAccountGoves(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
