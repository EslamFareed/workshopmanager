import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_brand.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_district.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_goves.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_media.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_review.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_service.dart';
import 'package:workshopmanager/Feature/about_workshop/data/model/about_workshop_working_houre.dart';

class AboutWorkshopModel with EquatableMixin {
  final String? logo;
  final int? id;
  final String? name;
  final String? address;
  final String? geoLat;
  final String? geoLng;
  final String? phone1;
  final String? arDescription;
  final String? enDescription;
  final int? ordersCapacity;
  final int? freeOrdersSpace;
  final int? orderCount;
  final double? priceRating;
  final double? starRatingAvg;
  final bool? isActive;
  final AboutWorkshopGoves? government;
  final AboutWorkshopDistrict? center;
  final List<AboutWorkshopBrand>? brands;
  final List<AboutWorkshopService>? services;
  final List<AboutWorkshopReview>? reviews;
  final List<AboutWorkshopWorkingHoure>? workingHours;
  final List<AboutWorkshopMedia>? media;
  final List<String>? images;
  AboutWorkshopModel({
    this.media,
    this.reviews,
    this.workingHours,
    this.logo,
    this.id,
    this.name,
    this.address,
    this.geoLat,
    this.geoLng,
    this.phone1,
    this.arDescription,
    this.enDescription,
    this.ordersCapacity,
    this.freeOrdersSpace,
    this.orderCount,
    this.priceRating,
    this.starRatingAvg,
    this.isActive,
    this.government,
    this.center,
    this.brands,
    this.services,
    this.images,
  });

  // fromJson
  factory AboutWorkshopModel.fromJson(Map<String, dynamic> json) {
    return AboutWorkshopModel(
      logo: json['logo'],
      id: json['id'],
      name: json['name'],
      address: json['address'],
      geoLat: json['geo_lat'],
      geoLng: json['geo_lng'],
      phone1: json['phone_1'],
      arDescription: json['ar_description'],
      enDescription: json['en_description'],
      ordersCapacity: json['orders_capacity'],
      freeOrdersSpace: json['free_orders_space'],
      orderCount: json['order_count'],
      priceRating: (json['price_rating'] != null)
          ? json['price_rating'].toDouble()
          : null,
      starRatingAvg: (json['star_rating_avg'] != null)
          ? json['star_rating_avg'].toDouble()
          : null,
      isActive: json['is_active'] == 1,
      government: json['government'] != null
          ? AboutWorkshopGoves.fromJson(json['government'])
          : null,
      center: json['center'] != null
          ? AboutWorkshopDistrict.fromJson(json['center'])
          : null,
      brands: json['brands'] != null
          ? List<AboutWorkshopBrand>.from(
              json['brands'].map((x) => AboutWorkshopBrand.fromJson(x)))
          : null,
      services: json['services'] != null
          ? List<AboutWorkshopService>.from(
              json['services'].map((x) => AboutWorkshopService.fromJson(x)))
          : null,
      reviews: json['reviews'] != null
          ? List<AboutWorkshopReview>.from(
              json['reviews'].map((x) => AboutWorkshopReview.fromJson(x)))
          : null,
      workingHours: json['working_hours'] != null
          ? List<AboutWorkshopWorkingHoure>.from(json['working_hours']
              .map((x) => AboutWorkshopWorkingHoure.fromJson(x)))
          : null,
      media: json['media'] != null
          ? List<AboutWorkshopMedia>.from(
              json['working_hours'].map((x) => AboutWorkshopMedia.fromJson(x)))
          : null,
      images: List<String>.from(json['images'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
        logo,
        id,
        name,
        address,
        geoLat,
        geoLng,
        phone1,
        arDescription,
        enDescription,
        ordersCapacity,
        freeOrdersSpace,
        orderCount,
        priceRating,
        starRatingAvg,
        isActive,
        government,
        center,
        brands,
        services,
        media,
        images
      ];
}
