import 'package:equatable/equatable.dart';

class OrderDetailsWorkshopDistrict with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const OrderDetailsWorkshopDistrict({this.id, this.arName, this.enName});

  factory OrderDetailsWorkshopDistrict.fromJson(Map<String, dynamic> json) {
    return OrderDetailsWorkshopDistrict(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
