import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/add_workshop/data/model/workshop_center_model.dart';
import 'package:workshopmanager/Feature/add_workshop/data/model/workshop_working_hourse.dart';
import 'workshop_brand_model.dart';
import 'workshop_goves_model.dart';

class WorkshopModel with EquatableMixin {
  final String? logo;
  final int? id;
  final String? address;
  final String? name;
  final String? geoLat;
  final String? geoLng;
  final String? phone1;
  final String? arDescription;
  final String? enDescription;
  final int? ordersCapacity;
  final int? freeOrdersSpace;
  final int? orderCount;
  final double? priceRating;
  final int? isActive;
  final WorkshopGovesModel? government;
  final WorkshopCenterModel? center;
  final List<WorkshopBrandModel>? brands;
  final List<WorkshopWorkingHourse>? workingHours;

  WorkshopModel({
    this.logo,
    this.id,
    this.address,
    this.name,
    this.geoLat,
    this.geoLng,
    this.phone1,
    this.arDescription,
    this.enDescription,
    this.ordersCapacity,
    this.freeOrdersSpace,
    this.orderCount,
    this.priceRating,
    this.isActive,
    this.government,
    this.center,
    this.brands,
    this.workingHours,
  });

  factory WorkshopModel.fromJson(Map<String, dynamic> json) {
    return WorkshopModel(
      logo: json['logo'],
      id: json['id'],
      address: json['address'],
      name: json['name'],
      geoLat: json['geo_lat'],
      geoLng: json['geo_lng'],
      phone1: json['phone_1'],
      arDescription: json['ar_description'],
      enDescription: json['en_description'],
      ordersCapacity: json['orders_capacity'],
      freeOrdersSpace: json['free_orders_space'],
      orderCount: json['order_count'],
      priceRating: json['price_rating']?.toDouble(),
      isActive: json['is_active'],
      government: json['government'] != null
          ? WorkshopGovesModel.fromJson(json['government'])
          : null,
      center: json['center'] != null
          ? WorkshopCenterModel.fromJson(json['center'])
          : null,
      brands: json['brands'] != null
          ? List<WorkshopBrandModel>.from(
              json['brands'].map((brand) => WorkshopBrandModel.fromJson(brand)))
          : null,
      workingHours: json['working_hours'] != null
          ? List<WorkshopWorkingHourse>.from(json['working_hours']
              .map((hour) => WorkshopWorkingHourse.fromJson(hour)))
          : null,
    );
  }

  @override
  List<Object?> get props => [
        logo,
        id,
        address,
        name,
        geoLat,
        geoLng,
        phone1,
        arDescription,
        enDescription,
        ordersCapacity,
        freeOrdersSpace,
        orderCount,
        priceRating,
        isActive,
        government,
        center,
        brands,
        workingHours,
      ];
}
