import 'package:equatable/equatable.dart';

import 'suggested_service_workshop_service_pivot.dart';
import 'suggested_service_worshop_service_media.dart';

class SuggestedServiceWorkshopService extends Equatable {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? type;
  final bool? isMainService;
  final bool? requireCarBrand;
  final String? enName;
  final String? enDescription;
  final String? arName;
  final String? arDescription;
  final bool? isActive;
  final int? parentId;
  final bool? hasProducts;
  final int? categoryId;
  final String? serviceImage;
  final SuggestedServiceWorkshopServicePivot? pivot;
  final List<SuggestedServiceWorshopServiceMedia>? media;

  const SuggestedServiceWorkshopService({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.isMainService,
    this.requireCarBrand,
    this.enName,
    this.enDescription,
    this.arName,
    this.arDescription,
    this.isActive,
    this.parentId,
    this.hasProducts,
    this.categoryId,
    this.serviceImage,
    this.pivot,
    this.media,
  });

  factory SuggestedServiceWorkshopService.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceWorkshopService(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      type: json['type'] as String?,
      isMainService: json['is_main_service'] == 1,
      requireCarBrand: json['require_car_brand'] == 1,
      enName: json['en_name'] as String?,
      enDescription: json['en_description'] as String?,
      arName: json['ar_name'] as String?,
      arDescription: json['ar_description'] as String?,
      isActive: json['is_active'] == 1,
      parentId: json['parent_id'] as int?,
      hasProducts: json['has_products'] == 1,
      categoryId: json['category_id'] as int?,
      serviceImage: json['service_image'] as String?,
      pivot: json['pivot'] != null
          ? SuggestedServiceWorkshopServicePivot.fromJson(
              json['pivot'] as Map<String, dynamic>)
          : null,
      media: (json['media'] as List<dynamic>?)
          ?.map(
            (e) => SuggestedServiceWorshopServiceMedia.fromJson(
                e as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        type,
        isMainService,
        requireCarBrand,
        enName,
        enDescription,
        arName,
        arDescription,
        isActive,
        parentId,
        hasProducts,
        categoryId,
        serviceImage,
        pivot,
        media,
      ];
}
