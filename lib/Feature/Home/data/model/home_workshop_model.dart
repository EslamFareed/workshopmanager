import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/Home/data/model/home_workshop_goves.dart';

import 'home_workshops_center_model.dart';

class HomeWorkshopModel extends Equatable {
  final String? logo;
  final int? id;
  final String? name;
  final int? goveId;
  final int? distId;
  final int? orderCount;
  final int? ordersCapacity;
  final int? freeOrdersSpace;
  final double? priceRating;
  final double? starRatingAvg;
  final bool? isActive;
  final HomeWorkshopGoves? government;
  final HomeWorkshopsCenterModel? center;

  const HomeWorkshopModel({
    this.logo,
    this.id,
    this.name,
    this.goveId,
    this.distId,
    this.orderCount,
    this.ordersCapacity,
    this.freeOrdersSpace,
    this.priceRating,
    this.starRatingAvg,
    this.isActive,
    this.government,
    this.center,
  });

  factory HomeWorkshopModel.fromJson(Map<String, dynamic> json) {
    return HomeWorkshopModel(
      logo: json['logo'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      goveId: json['gove_id'] as int?,
      distId: json['dist_id'] as int?,
      orderCount: json['order_count'] as int?,
      ordersCapacity: json['orders_capacity'] as int?,
      freeOrdersSpace: json['free_orders_space'] as int?,
      priceRating: json['price_rating'] != null
          ? (json['price_rating'] as num).toDouble()
          : null,
      starRatingAvg: json['star_rating_avg'] != null
          ? (json['star_rating_avg'] as num).toDouble()
          : null,
      isActive: json['is_active'] == 1 ? true : false,
      government: json['government'] != null
          ? HomeWorkshopGoves.fromJson(json['government'])
          : null,
      center: json['center'] != null
          ? HomeWorkshopsCenterModel.fromJson(json['center'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        logo,
        id,
        name,
        goveId,
        distId,
        orderCount,
        ordersCapacity,
        freeOrdersSpace,
        priceRating,
        starRatingAvg,
        isActive,
        government,
        center,
      ];
}
