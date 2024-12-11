import 'package:equatable/equatable.dart';

class WorkshopOrderMetaLink with EquatableMixin {
  final String? url;
  final String? label;
  final bool? active;

  const WorkshopOrderMetaLink({
    this.url,
    this.label,
    this.active,
  });

  factory WorkshopOrderMetaLink.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderMetaLink(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );
  }

  @override
  List<Object?> get props => [url, label, active];
}
