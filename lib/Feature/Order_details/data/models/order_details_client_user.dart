import 'package:equatable/equatable.dart';

class OrderDetailsClientUser with EquatableMixin {
  final int? id;
  final String? name;
  final String? avatar;

  const OrderDetailsClientUser({this.id, this.name, this.avatar});

  factory OrderDetailsClientUser.fromJson(Map<String, dynamic> json) {
    return OrderDetailsClientUser(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  @override
  List<Object?> get props => [id, name, avatar];
}
