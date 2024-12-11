import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/add_workshop_manager/data/model/add_workshop_manager_employer.dart';

class AddWorkshopManagerModel with EquatableMixin {
  int? id;
  String? avatar;
  String? name;
  int? isActive;
  String? type;
  AddWorkshopManagerEmployer? employer;

  AddWorkshopManagerModel({
    required this.id,
    required this.avatar,
    required this.name,
    required this.isActive,
    required this.type,
    required this.employer,
  });

  @override
  List<Object?> get props => [id, avatar, name, isActive, type, employer];

  factory AddWorkshopManagerModel.fromJson(Map<String, dynamic> json) {
    return AddWorkshopManagerModel(
      id: json['id'] as int?,
      avatar: json['avatar'],
      name: json['name'] as String?,
      isActive: json['is_active'] as int?,
      type: json['type'] as String?,
      employer: AddWorkshopManagerEmployer.fromJson(json['employer']),
    );
  }
}
