import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/goves_and_district/data/models/goves_and_district_childern_model.dart';

class GovesAndDistrict with EquatableMixin {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? enName;
  String? arName;
  String? category;
  int? isActive;
  String? geoLat;
  String? geoLng;
  String? districtId;
  List<GovesAndDistrictChildernModel>? children;

  GovesAndDistrict({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.enName,
    this.arName,
    this.category,
    this.isActive,
    this.geoLat,
    this.geoLng,
    this.districtId,
    this.children,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        enName,
        arName,
        category,
        isActive,
        geoLat,
        geoLng,
        districtId,
        children
      ];

  factory GovesAndDistrict.fromJson(Map<String, dynamic> json) {
    return GovesAndDistrict(
      id: json['id'] as int?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      enName: json['en_name'] as String?,
      arName: json['ar_name'] as String?,
      category: json['category'] as String?,
      isActive: json['is_active'] as int?,
      geoLat: json['geo_lat'] as String?,
      geoLng: json['geo_lng'] as String?,
      districtId: json['district_id'],
      children: (json['children'] as List<dynamic>?)
          ?.map((e) =>
              GovesAndDistrictChildernModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
