import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_workshop_district.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_workshop_goves.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_workshop_service.dart';

class OrderDetailsWorkshop with EquatableMixin {
  final int? id;
  final String? logo;
  final String? name;
  final String? address;
  final String? geoLat;
  final String? geoLng;
  final List<OrderDetailsWorkshopService>? services;
  final OrderDetailsWorkshopGoves? government;
  final OrderDetailsWorkshopDistrict? center;

  OrderDetailsWorkshop({
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

  factory OrderDetailsWorkshop.fromJson(Map<String, dynamic> json) {
    return OrderDetailsWorkshop(
      id: json['id'],
      logo: json['logo'],
      name: json['name'],
      address: json['address'],
      geoLat: json['geo_lat'],
      geoLng: json['geo_lng'],
      services: json['services'] != null
          ? List<OrderDetailsWorkshopService>.from(json['services']
              .map((x) => OrderDetailsWorkshopService.fromJson(x)))
          : null,
      government: json['government'] != null
          ? OrderDetailsWorkshopGoves.fromJson(json['government'])
          : null,
      center: json['center'] != null
          ? OrderDetailsWorkshopDistrict.fromJson(json['center'])
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
