import 'package:equatable/equatable.dart';

class Profile with EquatableMixin {
  String? companyName;
  Null website;
  String? taxCard;
  String? companyRegisteration;

  Profile({
    this.companyName,
    this.website,
    this.taxCard,
    this.companyRegisteration,
  });

  @override
  List<Object?> get props =>
      [companyName, website, taxCard, companyRegisteration];

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      companyName: json['company_name'] as String?,
      website: json['website'] as Null,
      taxCard: json['tax_card'] as String?,
      companyRegisteration: json['company_registeration'] as String?,
    );
  }
}
