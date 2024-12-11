import 'package:equatable/equatable.dart';

class SuggestedServiceServicesPivot with EquatableMixin {
  final int? orderId;
  final int? serviceId;
  final int? id;
  final String? status;
  final double? price;
  final int? estimatedTime;
  final String? estimatedTimeType;
  final String? shahmStatus;

  const SuggestedServiceServicesPivot({
    this.orderId,
    this.serviceId,
    this.id,
    this.status,
    this.price,
    this.estimatedTime,
    this.estimatedTimeType,
    this.shahmStatus,
  });

  factory SuggestedServiceServicesPivot.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceServicesPivot(
      orderId: json['order_id'] as int?,
      serviceId: json['service_id'] as int?,
      id: json['id'] as int?,
      status: json['status'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      estimatedTime: json['estimated_time'] as int?,
      estimatedTimeType: json['estimated_time_type'] as String?,
      shahmStatus: json['shahm_status'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        orderId,
        serviceId,
        id,
        status,
        price,
        estimatedTime,
        estimatedTimeType,
        shahmStatus,
      ];
}
