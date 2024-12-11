import 'package:equatable/equatable.dart';

class GovesAndDistrictChildernModel with EquatableMixin {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? enName;
  String? arName;
  String? category;
  int? isActive;
  String? geoLat;
  String? geoLng;
  int? districtId;

  GovesAndDistrictChildernModel({
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
        districtId
      ];

  factory GovesAndDistrictChildernModel.fromJson(Map<String, dynamic> json) {
    return GovesAndDistrictChildernModel(
      id: json['id'] as int?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      enName: json['en_name'] as String?,
      arName: json['ar_name'] as String?,
      category: json['category'] as String?,
      isActive: json['is_active'] as int?,
      geoLat: json['geo_lat'],
      geoLng: json['geo_lng'],
      districtId: json['district_id'] as int?,
    );
  }
}
