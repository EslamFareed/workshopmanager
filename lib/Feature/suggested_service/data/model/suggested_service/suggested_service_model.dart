import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_car.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_client.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_services.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_workshop.dart';

class SuggestedServiceModel with EquatableMixin {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final double? totalPrice;
  final String? type;
  final String? reservationDate;
  final int? orderNumber;
  final String? status;
  final SuggestedServiceWorkshop? workshop;
  final SuggestedServiceClient? client;
  final SuggestedServiceCar? car;
  final List<SuggestedServiceServices>? services;
  final int? isReviewed;

  const SuggestedServiceModel({
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

  factory SuggestedServiceModel.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceModel(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      totalPrice: (json['total_price'] as num?)?.toDouble(),
      type: json['type'] as String?,
      reservationDate: json['reservation_date'] as String?,
      orderNumber: json['order_number'] as int?,
      status: json['status'] as String?,
      workshop: json['workshop'] != null
          ? SuggestedServiceWorkshop.fromJson(
              json['workshop'] as Map<String, dynamic>)
          : null,
      client: json['client'] != null
          ? SuggestedServiceClient.fromJson(
              json['client'] as Map<String, dynamic>)
          : null,
      car: json['car'] != null
          ? SuggestedServiceCar.fromJson(json['car'] as Map<String, dynamic>)
          : null,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) =>
              SuggestedServiceServices.fromJson(e as Map<String, dynamic>))
          .toList(),
      isReviewed: json['is_reviewed'],
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
