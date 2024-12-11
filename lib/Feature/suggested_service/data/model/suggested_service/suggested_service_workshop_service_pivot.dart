import 'package:equatable/equatable.dart';

class SuggestedServiceWorkshopServicePivot with EquatableMixin {
  final int? workShopId;
  final int? serviceId;
  final double? price;
  final int? estimatedTime;
  final String? estimatedTimeType;
  final String? requiredBrands;

  const SuggestedServiceWorkshopServicePivot({
    this.workShopId,
    this.serviceId,
    this.price,
    this.estimatedTime,
    this.estimatedTimeType,
    this.requiredBrands,
  });

  factory SuggestedServiceWorkshopServicePivot.fromJson(
      Map<String, dynamic> json) {
    return SuggestedServiceWorkshopServicePivot(
      workShopId: json['work_shop_id'] as int?,
      serviceId: json['service_id'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      estimatedTime: json['astimated_time'] as int?,
      estimatedTimeType: json['astimated_time_type'] as String?,
      requiredBrands: json['required_brands'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        workShopId,
        serviceId,
        price,
        estimatedTime,
        estimatedTimeType,
        requiredBrands,
      ];
}
