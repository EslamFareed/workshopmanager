import 'package:equatable/equatable.dart';

class SuggestedServiceCarBrand with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;
  final String? logo;

  const SuggestedServiceCarBrand(
      {this.id, this.arName, this.enName, this.logo});

  factory SuggestedServiceCarBrand.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceCarBrand(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
      logo: json['logo'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName, logo];
}
