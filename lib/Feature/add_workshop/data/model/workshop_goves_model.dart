import 'package:equatable/equatable.dart';

class WorkshopGovesModel with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const WorkshopGovesModel({this.id, this.arName, this.enName});

  factory WorkshopGovesModel.fromJson(Map<String, dynamic> json) {
    return WorkshopGovesModel(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        arName,
        enName,
      ];
}
