import 'package:equatable/equatable.dart';

class WorkshopOrderCarModel with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const WorkshopOrderCarModel({
    this.id,
    this.arName,
    this.enName,
  });

  factory WorkshopOrderCarModel.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderCarModel(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
