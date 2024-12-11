import 'package:equatable/equatable.dart';

class SuggestedServicesWorkshopDist with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const SuggestedServicesWorkshopDist({
    this.id,
    this.arName,
    this.enName,
  });

  factory SuggestedServicesWorkshopDist.fromJson(Map<String, dynamic> json) {
    return SuggestedServicesWorkshopDist(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
