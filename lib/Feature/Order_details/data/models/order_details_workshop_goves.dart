import 'package:equatable/equatable.dart';

class OrderDetailsWorkshopGoves with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const OrderDetailsWorkshopGoves({this.id, this.arName, this.enName});

  factory OrderDetailsWorkshopGoves.fromJson(Map<String, dynamic> json) {
    return OrderDetailsWorkshopGoves(
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
