import 'package:equatable/equatable.dart';

class OrderDetailsServicePivot with EquatableMixin {
  final int orderId;
  final int serviceId;
  final int id;
  final String status;
  final double price;
  final double estimatedTime;
  final String estimatedTimeType;
  final String? shahmStatus;

  const OrderDetailsServicePivot({
    required this.orderId,
    required this.serviceId,
    required this.id,
    required this.status,
    required this.price,
    required this.estimatedTime,
    required this.estimatedTimeType,
    this.shahmStatus,
  });

  factory OrderDetailsServicePivot.fromJson(Map<String, dynamic> json) {
    return OrderDetailsServicePivot(
      orderId: json['order_id'],
      serviceId: json['service_id'],
      id: json['id'],
      status: json['status'],
      price: (json['price'] as num).toDouble(),
      estimatedTime: (json['astimated_time'] as num).toDouble(),
      estimatedTimeType: json['astimated_time_type'],
      shahmStatus: json['shahm_status'] == "null" ? null : json['shahm_status'],
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
        shahmStatus
      ];
}
