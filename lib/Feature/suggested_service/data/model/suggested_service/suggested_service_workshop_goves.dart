import 'package:equatable/equatable.dart';

class SuggestedServiceWorkshopGoves with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const SuggestedServiceWorkshopGoves({
    this.id,
    this.arName,
    this.enName,
  });

  factory SuggestedServiceWorkshopGoves.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceWorkshopGoves(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
