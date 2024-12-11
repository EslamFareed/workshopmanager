import 'package:equatable/equatable.dart';

import 'order_details_workshop_details_media.dart';
import 'order_details_workshop_service_pivot.dart';

class OrderDetailsWorkshopService extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
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
  final String? serviceImage;
  final OrderDetailsWorkshopServicePivot? pivot;
  final List<OrderDetailsWorkshopDetailsMedia>? media;

  const OrderDetailsWorkshopService({
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
    this.serviceImage,
    this.pivot,
    this.media,
  });

  factory OrderDetailsWorkshopService.fromJson(Map<String, dynamic> json) {
    return OrderDetailsWorkshopService(
      id: json['id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      type: json['type'],
      isMainService: json['is_main_service'] == 1,
      requireCarBrand: json['require_car_brand'] == 1,
      enName: json['en_name'],
      enDescription: json['en_description'],
      arName: json['ar_name'],
      arDescription: json['ar_description'],
      isActive: json['is_active'] == 1,
      parentId: json['parent_id'],
      hasProducts: json['has_products'] == 1,
      serviceImage: json['service_image'],
      pivot: json['pivot'] != null
          ? OrderDetailsWorkshopServicePivot.fromJson(json['pivot'])
          : null,
      media: (json['media'] as List?)
          ?.map((e) => OrderDetailsWorkshopDetailsMedia.fromJson(e))
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
        serviceImage,
        pivot,
        media
      ];
}
