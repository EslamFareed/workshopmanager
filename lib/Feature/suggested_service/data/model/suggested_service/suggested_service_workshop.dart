import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_workshop_goves.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_services_workshop_dist.dart';

import 'suggested_service_workshop_service.dart';

class SuggestedServiceWorkshop with EquatableMixin {
  final int? id;
  final String? logo;
  final String? name;
  final String? address;
  final String? geoLat;
  final String? geoLng;
  final List<SuggestedServiceWorkshopService>? services;
  final SuggestedServiceWorkshopGoves? government;
  final SuggestedServicesWorkshopDist? center;

  const SuggestedServiceWorkshop({
    this.id,
    this.logo,
    this.name,
    this.address,
    this.geoLat,
    this.geoLng,
    this.services,
    this.government,
    this.center,
  });

  factory SuggestedServiceWorkshop.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceWorkshop(
      id: json['id'] as int?,
      logo: json['logo'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      geoLat: json['geo_lat'] as String?,
      geoLng: json['geo_lng'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => SuggestedServiceWorkshopService.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      government: json['government'] != null
          ? SuggestedServiceWorkshopGoves.fromJson(
              json['government'] as Map<String, dynamic>)
          : null,
      center: json['center'] != null
          ? SuggestedServicesWorkshopDist.fromJson(
              json['center'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        logo,
        name,
        address,
        geoLat,
        geoLng,
        services,
        government,
        center,
      ];
}
