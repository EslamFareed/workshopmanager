import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_client_user.dart';

class WorkshopOrderClient with EquatableMixin {
  final int? id;
  final WorkshopOrderClientUser? user;

  const WorkshopOrderClient({
    this.id,
    this.user,
  });

  factory WorkshopOrderClient.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderClient(
      id: json['id'] as int?,
      user: json['user'] != null
          ? WorkshopOrderClientUser.fromJson(
              json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, user];
}
