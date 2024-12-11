import 'package:equatable/equatable.dart';

class AboutWorkshopDistrict with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  AboutWorkshopDistrict({this.id, this.arName, this.enName});

  factory AboutWorkshopDistrict.fromJson(Map<String, dynamic> json) {
    return AboutWorkshopDistrict(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
