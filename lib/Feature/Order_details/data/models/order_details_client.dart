import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/Order_details/data/models/order_details_client_user.dart';

class OrderDetailsClient with EquatableMixin {
  final int? id;
  final OrderDetailsClientUser? user;

  const OrderDetailsClient({this.id, this.user});

  factory OrderDetailsClient.fromJson(Map<String, dynamic> json) {
    return OrderDetailsClient(
      id: json['id'],
      user: json['user'] != null
          ? OrderDetailsClientUser.fromJson(json['user'])
          : null,
    );
  }

  @override
  List<Object?> get props => [id, user];
}
