import 'package:equatable/equatable.dart';

class AboutWorkshopService with EquatableMixin {
  final int? id;
  final String? enName;
  final String? enDescription;
  final String? serviceImage;

  AboutWorkshopService(
      {this.id, this.enName, this.enDescription, this.serviceImage});

  factory AboutWorkshopService.fromJson(Map<String, dynamic> json) {
    return AboutWorkshopService(
      id: json['id'],
      enName: json['en_name'],
      enDescription: json['en_description'],
      serviceImage: json['media'] != null && json['media'].isNotEmpty
          ? json['media'][0]['original_url']
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        enName,
        enDescription,
        serviceImage,
      ];
}
