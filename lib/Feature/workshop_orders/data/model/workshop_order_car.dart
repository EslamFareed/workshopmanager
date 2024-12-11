import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_car_brand.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_car_model.dart';

class WorkshopOrderCar with EquatableMixin {
  final int? id;
  final String? transmissionType;
  final String? modelYear;
  final WorkshopOrderCarBrand? brand;
  final WorkshopOrderCarModel? model;

  const WorkshopOrderCar({
    this.id,
    this.transmissionType,
    this.modelYear,
    this.brand,
    this.model,
  });

  factory WorkshopOrderCar.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderCar(
      id: json['id'] as int?,
      transmissionType: json['transmission_type'] as String?,
      modelYear: json['model_year'] as String?,
      brand: json['brand'] != null
          ? WorkshopOrderCarBrand.fromJson(
              json['brand'] as Map<String, dynamic>)
          : null,
      model: json['model'] != null
          ? WorkshopOrderCarModel.fromJson(
              json['model'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, transmissionType, modelYear, brand, model];
}
