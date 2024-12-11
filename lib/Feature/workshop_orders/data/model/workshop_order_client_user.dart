import 'package:equatable/equatable.dart';

class WorkshopOrderClientUser with EquatableMixin {
  final int? id;
  final String? name;
  final String? avatar;

  const WorkshopOrderClientUser({
    this.id,
    this.name,
    this.avatar,
  });

  factory WorkshopOrderClientUser.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderClientUser(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, avatar];
}
