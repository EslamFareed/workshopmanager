import 'package:equatable/equatable.dart';

class WorkshopCenterModel with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const WorkshopCenterModel({this.id, this.arName, this.enName});

  factory WorkshopCenterModel.fromJson(Map<String, dynamic> json) {
    return WorkshopCenterModel(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
