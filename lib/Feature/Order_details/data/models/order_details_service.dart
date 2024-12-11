import 'package:equatable/equatable.dart';
import 'order_details_service_pivot.dart';

class OrderDetailsService with EquatableMixin {
  final int? serviceId;
  final String enName;
  final String arName;
  final String? serviceImage;
  final OrderDetailsServicePivot pivot;

  const OrderDetailsService({
    required this.serviceId,
    required this.enName,
    required this.arName,
    this.serviceImage,
    required this.pivot,
  });

  factory OrderDetailsService.fromJson(Map<String, dynamic> json) {
    return OrderDetailsService(
      serviceId: json['service_id'],
      enName: json['en_name'],
      arName: json['ar_name'],
      serviceImage:
          json['service_image'] == "null" ? null : json['service_image'],
      pivot: OrderDetailsServicePivot.fromJson(json['pivot']),
    );
  }

  @override
  List<Object?> get props => [
        serviceId,
        enName,
        arName,
        serviceImage,
        pivot,
      ];
}
