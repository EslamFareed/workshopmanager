import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/data/model/add_workshop_manager_workshops_district.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/data/model/add_workshop_manager_workshops_goves.dart';

class AddWorkshopManagerWorkshops with EquatableMixin {
  int? id;
  String? name;
  String? address;
  String? logo;
  AddWorkshopManagerWorkshopsGoves? government;
  AddWorkshopManagerWorkshopsDistrict? center;

  AddWorkshopManagerWorkshops({
    required this.id,
    required this.name,
    required this.address,
    required this.logo,
    required this.government,
    required this.center,
  });

  @override
  List<Object?> get props => [id, name, address, logo, government, center];

  factory AddWorkshopManagerWorkshops.fromJson(Map<String, dynamic> json) {
    return AddWorkshopManagerWorkshops(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      logo: json['logo'],
      government: AddWorkshopManagerWorkshopsGoves.fromJson(
          json['government'] as Map<String, dynamic>),
      center: AddWorkshopManagerWorkshopsDistrict.fromJson(
          json['center'] as Map<String, dynamic>),
    );
  }
}
