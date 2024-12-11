import 'package:equatable/equatable.dart';

class AboutWorkshopWorkingHoure with EquatableMixin {
  final String? name;

  AboutWorkshopWorkingHoure(this.name);
  @override
  List<Object?> get props => [name];

  factory AboutWorkshopWorkingHoure.fromJson(Map<String, dynamic> json) {
    return AboutWorkshopWorkingHoure(json['name'] as String?);
  }
}
