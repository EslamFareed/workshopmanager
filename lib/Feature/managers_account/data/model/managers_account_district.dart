import 'package:equatable/equatable.dart';

class ManagersAccountDistrict with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const ManagersAccountDistrict({
    this.id,
    this.arName,
    this.enName,
  });

  factory ManagersAccountDistrict.fromJson(Map<String, dynamic> json) {
    return ManagersAccountDistrict(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
