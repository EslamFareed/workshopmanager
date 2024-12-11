import 'package:equatable/equatable.dart';

class AboutWorkshopGoves with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  AboutWorkshopGoves({this.id, this.arName, this.enName});

  factory AboutWorkshopGoves.fromJson(Map<String, dynamic> json) {
    return AboutWorkshopGoves(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
