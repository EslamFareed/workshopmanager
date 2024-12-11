import 'package:equatable/equatable.dart';

class WorkshopBrandModel with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;
  final String? logo;

  const WorkshopBrandModel({this.id, this.arName, this.enName, this.logo});

  factory WorkshopBrandModel.fromJson(Map<String, dynamic> json) {
    return WorkshopBrandModel(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      logo: json['logo'],
    );
  }

  @override
  List<Object?> get props => [id, arName, enName, logo];
}
