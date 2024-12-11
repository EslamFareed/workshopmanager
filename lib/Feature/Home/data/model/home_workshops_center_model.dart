import 'package:equatable/equatable.dart';

class HomeWorkshopsCenterModel with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const HomeWorkshopsCenterModel({this.id, this.arName, this.enName});

  factory HomeWorkshopsCenterModel.fromJson(Map<String, dynamic> json) {
    return HomeWorkshopsCenterModel(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
