import 'package:equatable/equatable.dart';

class AboutWorkshopBrand with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;
  final String? logo;

  AboutWorkshopBrand({this.id, this.arName, this.enName, this.logo});

  factory AboutWorkshopBrand.fromJson(Map<String, dynamic> json) {
    return AboutWorkshopBrand(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      logo: json['media'] != null && json['media'].isNotEmpty
          ? json['media'][0]['original_url']
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        arName,
        enName,
        logo,
      ];
}
