import 'package:equatable/equatable.dart';

class OrderDetailsCarBrand with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;
  final String? logo;

  const OrderDetailsCarBrand({this.id, this.arName, this.enName, this.logo});

  factory OrderDetailsCarBrand.fromJson(Map<String, dynamic> json) {
    return OrderDetailsCarBrand(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      logo: json['logo'],
    );
  }

  @override
  List<Object?> get props => [id, arName, enName, logo];
}
