import 'package:equatable/equatable.dart';

class AddWorkshopManagerWorkshopsGoves with EquatableMixin {
  int? id;
  String? arName;
  String? enName;

  AddWorkshopManagerWorkshopsGoves({
    required this.id,
    required this.arName,
    required this.enName,
  });

  @override
  List<Object?> get props => [id, arName, enName];

  factory AddWorkshopManagerWorkshopsGoves.fromJson(Map<String, dynamic> json) {
    return AddWorkshopManagerWorkshopsGoves(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }
}
