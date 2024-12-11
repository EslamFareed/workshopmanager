import 'package:equatable/equatable.dart';

import 'workshop_car_model.dart';
import 'workshop_media_model.dart';

class WorkshopCarBrand with EquatableMixin {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? arName;
  final String? enName;
  final String? category;
  final bool? isActive;
  final int? brandId;
  final String? logo;
  final List<WorkshopCarModel>? models;
  final List<WorkshopMediaModel>? media;

  WorkshopCarBrand({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.arName,
    this.enName,
    this.category,
    this.isActive,
    this.brandId,
    this.logo,
    this.models,
    this.media,
  });

  factory WorkshopCarBrand.fromJson(Map<String, dynamic> json) {
    return WorkshopCarBrand(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      arName: json['ar_name'],
      enName: json['en_name'],
      category: json['category'],
      isActive: json['is_active'] == 1 ? true : false,
      brandId: json['brand_id'],
      logo: json['logo'],
      models: json['models'] != null
          ? List<WorkshopCarModel>.from(
              json['models'].map((x) => WorkshopCarModel.fromJson(x)))
          : null,
      media: json['media'] != null
          ? List<WorkshopMediaModel>.from(
              json['media'].map((x) => WorkshopMediaModel.fromJson(x)))
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        arName,
        enName,
        category,
        isActive,
        brandId,
        logo,
        models,
        media,
      ];
}
