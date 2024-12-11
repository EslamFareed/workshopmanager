import 'package:equatable/equatable.dart';

class HomeWorkshopLink with EquatableMixin {
  final String? url;
  final String? label;
  final bool? active;

  const HomeWorkshopLink({this.url, this.label, this.active});

  factory HomeWorkshopLink.fromJson(Map<String, dynamic> json) {
    return HomeWorkshopLink(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );
  }

  @override
  List<Object?> get props => [url, label, active];
}
