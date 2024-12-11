import 'package:equatable/equatable.dart';

class AddWorkshopManagerWorkshopsDistrict with EquatableMixin {
  int? id;
  String? arName;
  String? enName;

  AddWorkshopManagerWorkshopsDistrict({
    required this.id,
    required this.arName,
    required this.enName,
  });

  @override
  List<Object?> get props => [id, arName, enName];

  factory AddWorkshopManagerWorkshopsDistrict.fromJson(
      Map<String, dynamic> json) {
    return AddWorkshopManagerWorkshopsDistrict(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }
}
