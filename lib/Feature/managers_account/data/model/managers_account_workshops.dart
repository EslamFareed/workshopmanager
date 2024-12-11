import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/managers_account/data/model/managers_account_district.dart';
import 'package:workshopmanager/Feature/managers_account/data/model/managers_account_goves.dart';

class ManagersAccountWorkshops with EquatableMixin {
  final int? id;
  final String? name;
  final String? address;
  final String? logo;
  final ManagersAccountGoves? government;
  final ManagersAccountDistrict? center;

  const ManagersAccountWorkshops({
    this.id,
    this.name,
    this.address,
    this.logo,
    this.government,
    this.center,
  });

  factory ManagersAccountWorkshops.fromJson(Map<String, dynamic> json) {
    return ManagersAccountWorkshops(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      logo: json['logo'] as String?,
      government: json['government'] != null
          ? ManagersAccountGoves.fromJson(
              json['government'] as Map<String, dynamic>)
          : null,
      center: json['center'] != null
          ? ManagersAccountDistrict.fromJson(
              json['center'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, name, address, logo, government, center];
}
