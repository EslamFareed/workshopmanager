import 'package:equatable/equatable.dart';

class OrderDetailsWorkshopServicePivot with EquatableMixin {
  final int? orderId;
  final int? serviceId;
  final int? id;
  final String? status;
  final double? price;
  final int? astimatedTime;
  final String? astimatedTimeType;
  final String? shahmStatus;

  const OrderDetailsWorkshopServicePivot({
    this.orderId,
    this.serviceId,
    this.id,
    this.status,
    this.price,
    this.astimatedTime,
    this.astimatedTimeType,
    this.shahmStatus,
  });

  factory OrderDetailsWorkshopServicePivot.fromJson(Map<String, dynamic> json) {
    return OrderDetailsWorkshopServicePivot(
      orderId: json['order_id'],
      serviceId: json['service_id'],
      id: json['id'],
      status: json['status'],
      price: json['price']?.toDouble(),
      astimatedTime: json['astimated_time'],
      astimatedTimeType: json['astimated_time_type'],
      shahmStatus: json['shahm_status'],
    );
  }

  @override
  List<Object?> get props => [
        orderId,
        serviceId,
        id,
        status,
        price,
        astimatedTime,
        astimatedTimeType,
        shahmStatus
      ];
}
