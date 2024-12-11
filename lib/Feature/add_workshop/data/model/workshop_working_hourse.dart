import 'package:equatable/equatable.dart';

class WorkshopWorkingHourse with EquatableMixin {
  final String? day;
  final String? startHour;
  final String? endHour;
  final bool? isOff;

  const WorkshopWorkingHourse({
    this.day,
    this.startHour,
    this.endHour,
    this.isOff,
  });

  factory WorkshopWorkingHourse.fromJson(Map<String, dynamic> json) {
    return WorkshopWorkingHourse(
      day: json['day'],
      startHour: json['start_hour'],
      endHour: json['end_hour'],
      isOff: json['is_off'] == 1,
    );
  }

  @override
  List<Object?> get props => [day, startHour, endHour, isOff];
}
