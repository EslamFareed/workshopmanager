import 'package:equatable/equatable.dart';

class OrderDetailsCarModel with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const OrderDetailsCarModel({this.id, this.arName, this.enName});

  factory OrderDetailsCarModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsCarModel(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
