import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_car.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_client.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_service.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_workshop.dart';

class OrderDetailsModel with EquatableMixin {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final double? totalPrice;
  final String? type;
  final String? reservationDate;
  final int? orderNumber;
  final String? status;
  final OrderDetailsWorkshop? workshop;
  final OrderDetailsClient? client;
  final OrderDetailsCar? car;
  final List<OrderDetailsService>? services;
  final bool? isReviewed;

  OrderDetailsModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.totalPrice,
    this.type,
    this.reservationDate,
    this.orderNumber,
    this.status,
    this.workshop,
    this.client,
    this.car,
    this.services,
    this.isReviewed,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      totalPrice: json['total_price']?.toDouble(),
      type: json['type'],
      reservationDate: json['reservation_date'],
      orderNumber: json['order_number'],
      status: json['status'],
      workshop: json['workshop'] != null
          ? OrderDetailsWorkshop.fromJson(json['workshop'])
          : null,
      client: json['client'] != null
          ? OrderDetailsClient.fromJson(json['client'])
          : null,
      car: json['car'] != null ? OrderDetailsCar.fromJson(json['car']) : null,
      services: json['services'] != null
          ? List<OrderDetailsService>.from(
              json['services'].map((x) => OrderDetailsService.fromJson(x)))
          : null,
      isReviewed: json['is_reviewed'] == 1,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        totalPrice,
        type,
        reservationDate,
        orderNumber,
        status,
        workshop,
        client,
        car,
        services,
        isReviewed,
      ];
}
