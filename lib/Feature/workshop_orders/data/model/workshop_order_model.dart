import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_car.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_client.dart';

class WorkshopOrderModel with EquatableMixin {
  final int? id;
  final int? orderNumber;
  final String? createdAt;
  final String? updatedAt;
  final double? totalPrice;
  final String? type;
  final String? reservationDate;
  final String? status;
  final WorkshopOrderClient? client;
  final WorkshopOrderCar? car;

  const WorkshopOrderModel({
    this.id,
    this.orderNumber,
    this.createdAt,
    this.updatedAt,
    this.totalPrice,
    this.type,
    this.reservationDate,
    this.status,
    this.client,
    this.car,
  });

  factory WorkshopOrderModel.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderModel(
      id: json['id'] as int?,
      orderNumber: json['order_number'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      type: json['type'] as String?,
      reservationDate: json['reservation_date'] as String?,
      status: json['status'] as String?,
      client: json['client'] != null
          ? WorkshopOrderClient.fromJson(json['client'] as Map<String, dynamic>)
          : null,
      car: json['car'] != null
          ? WorkshopOrderCar.fromJson(json['car'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        orderNumber,
        createdAt,
        updatedAt,
        totalPrice,
        type,
        reservationDate,
        status,
        client,
        car,
      ];
}
