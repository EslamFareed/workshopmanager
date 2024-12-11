import 'package:equatable/equatable.dart';

import 'show_manager_dist.dart';
import 'show_manager_goves.dart';

class Workshops with EquatableMixin {
  int? id;
  String? name;
  String? address;
  String? logo;
  Government? government;
  Center? center;

  Workshops({
    this.id,
    this.name,
    this.address,
    this.logo,
    this.government,
    this.center,
  });

  @override
  List<Object?> get props => [id, name, address, logo, government, center];

  factory Workshops.fromJson(Map<String, dynamic> json) {
    return Workshops(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      logo: json['logo'] as String?,
      government: json['government'] == null
          ? null
          : Government.fromJson(json['government'] as Map<String, dynamic>),
      center: json['center'] == null
          ? null
          : Center.fromJson(json['center'] as Map<String, dynamic>),
    );
  }
}
