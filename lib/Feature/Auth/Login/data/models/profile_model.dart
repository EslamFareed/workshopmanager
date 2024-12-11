import 'package:equatable/equatable.dart';

class Profile with EquatableMixin {
  String? companyName;
  String? taxCard;
  String? companyRegisteration;

  Profile({
    this.companyName,
    this.taxCard,
    this.companyRegisteration,
  });

  @override
  List<Object?> get props => [companyName, taxCard, companyRegisteration];

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      companyName: json['company_name'] as String?,
      taxCard: json['tax_card'] as String?,
      companyRegisteration: json['company_registeration'] as String?,
    );
  }
}
