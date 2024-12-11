import 'package:equatable/equatable.dart';

class WorkshopOrderCarBrand with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;
  final String? logo;

  const WorkshopOrderCarBrand({
    this.id,
    this.arName,
    this.enName,
    this.logo,
  });

  factory WorkshopOrderCarBrand.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderCarBrand(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      logo: json['logo'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName, logo];
}
