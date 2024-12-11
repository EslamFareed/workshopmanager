import 'package:equatable/equatable.dart';

class HomeWorkshopGoves with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const HomeWorkshopGoves({this.id, this.arName, this.enName});

  factory HomeWorkshopGoves.fromJson(Map<String, dynamic> json) {
    return HomeWorkshopGoves(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
