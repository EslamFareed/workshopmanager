import 'package:equatable/equatable.dart';

class ManagersAccountLink with EquatableMixin {
  final String? url;
  final String? label;
  final bool? active;

  const ManagersAccountLink({
    this.url,
    this.label,
    this.active,
  });

  factory ManagersAccountLink.fromJson(Map<String, dynamic> json) {
    return ManagersAccountLink(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );
  }

  @override
  List<Object?> get props => [url, label, active];
}
