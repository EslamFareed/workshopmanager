import 'package:equatable/equatable.dart';

import 'service_info.dart';

class ServiceModel with EquatableMixin {
  int? id;
  int? workShopId;
  int? serviceId;
  int? price;
  int? astimatedTime;
  String? astimatedTimeType;
  String? requiredBrands;
  Service? service;

  ServiceModel({
    this.id,
    this.workShopId,
    this.serviceId,
    this.price,
    this.astimatedTime,
    this.astimatedTimeType,
    this.requiredBrands,
    this.service,
  });

  @override
  List<Object?> get props => [
        id,
        workShopId,
        serviceId,
        price,
        astimatedTime,
        astimatedTimeType,
        requiredBrands,
        service
      ];

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as int?,
      workShopId: json['work_shop_id'] as int?,
      serviceId: json['service_id'] as int?,
      price: json['price'] as int?,
      astimatedTime: json['astimated_time'] as int?,
      astimatedTimeType: json['astimated_time_type'] as String?,
      requiredBrands: json['required_brands'] as Null,
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
    );
  }
}
