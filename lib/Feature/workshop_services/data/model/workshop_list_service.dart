import "package:equatable/equatable.dart";
import "package:workshopmanager/Feature/workshop_services/data/model/workshop_list_service_media.dart";

class WorkshopListService with EquatableMixin {
  int id;
  String? createdAt;
  String? updatedAt;
  String? type;
  int? isMainService;
  int? requireCarBrand;
  String enName;
  String? enDescription;
  String arName;
  String? arDescription;
  int isActive;
  int? parentId;
  String? serviceImage;
  List<dynamic>? subCategory;
  List<WorkshopListServiceMedia>? media;

  WorkshopListService({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.isMainService,
    this.requireCarBrand,
    required this.enName,
    this.enDescription,
    required this.arName,
    this.arDescription,
    required this.isActive,
    this.parentId,
    this.serviceImage,
    this.subCategory,
    this.media,
  });

  factory WorkshopListService.fromJson(Map<String, dynamic> json) {
    return WorkshopListService(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      type: json['type'],
      isMainService: json['is_main_service'],
      requireCarBrand: json['require_car_brand'],
      enName: json['en_name'],
      enDescription: json['en_description'],
      arName: json['ar_name'],
      arDescription: json['ar_description'],
      isActive: json['is_active'],
      parentId: json['parent_id'],
      serviceImage: json['service_image'],
      subCategory: json['sub_category'] as List<dynamic>?,
      media: (json['events'] as List<dynamic>?)
          ?.map((e) =>
              WorkshopListServiceMedia.fromJson(e as Map<String, dynamic>))
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
        serviceImage,
        subCategory,
        media
      ];
}
