import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_car_brand.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_car_model.dart';

class SuggestedServiceCar with EquatableMixin {
  final int? id;
  final String? transmissionType;
  final String? modelYear;
  final SuggestedServiceCarBrand? brand;
  final SuggestedServiceCarModel? model;

  const SuggestedServiceCar({
    this.id,
    this.transmissionType,
    this.modelYear,
    this.brand,
    this.model,
  });

  factory SuggestedServiceCar.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceCar(
      id: json['id'] as int?,
      transmissionType: json['transmission_type'] as String?,
      modelYear: json['model_year'] as String?,
      brand: json['brand'] != null
          ? SuggestedServiceCarBrand.fromJson(
              json['brand'] as Map<String, dynamic>)
          : null,
      model: json['model'] != null
          ? SuggestedServiceCarModel.fromJson(
              json['model'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, transmissionType, modelYear, brand, model];
}
