import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_car_brand.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_car_model.dart';

class OrderDetailsCar with EquatableMixin {
  final int? id;
  final String? transmissionType;
  final String? modelYear;
  final OrderDetailsCarBrand? brand;
  final OrderDetailsCarModel? model;

  const OrderDetailsCar({
    this.id,
    this.transmissionType,
    this.modelYear,
    this.brand,
    this.model,
  });

  factory OrderDetailsCar.fromJson(Map<String, dynamic> json) {
    return OrderDetailsCar(
      id: json['id'],
      transmissionType: json['transmission_type'],
      modelYear: json['model_year'],
      brand: json['brand'] != null
          ? OrderDetailsCarBrand.fromJson(json['brand'])
          : null,
      model: json['model'] != null
          ? OrderDetailsCarModel.fromJson(json['model'])
          : null,
    );
  }

  @override
  List<Object?> get props => [id, transmissionType, modelYear, brand, model];
}
