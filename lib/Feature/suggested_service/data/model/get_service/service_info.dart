import 'package:equatable/equatable.dart';

class Service with EquatableMixin {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? type;
  int? isMainService;
  int? requireCarBrand;
  String? enName;
  String? enDescription;
  String? arName;
  String? arDescription;
  int? isActive;
  int? parentId;
  int? hasProducts;
  int? categoryId;

  Service({
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
  });

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
        categoryId
      ];

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      type: json['type'] as String?,
      isMainService: json['is_main_service'] as int?,
      requireCarBrand: json['require_car_brand'] as int?,
      enName: json['en_name'] as String?,
      enDescription: json['en_description'] as String?,
      arName: json['ar_name'] as String?,
      arDescription: json['ar_description'] as String?,
      isActive: json['is_active'] as int?,
      parentId: json['parent_id'] as int?,
      hasProducts: json['has_products'] as int?,
      categoryId: json['category_id'] as int?,
    );
  }
}
