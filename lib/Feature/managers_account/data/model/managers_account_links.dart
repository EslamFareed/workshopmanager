import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/managers_account/data/model/managers_account_link.dart';

class ManagersAccountLinks with EquatableMixin {
  final ManagersAccountLink? first;
  final ManagersAccountLink? last;
  final ManagersAccountLink? prev;
  final ManagersAccountLink? next;

  const ManagersAccountLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory ManagersAccountLinks.fromJson(Map<String, dynamic> json) {
    return ManagersAccountLinks(
      first: json['first'] != null
          ? ManagersAccountLink.fromJson(json['first'])
          : null,
      last: json['last'] != null
          ? ManagersAccountLink.fromJson(json['last'])
          : null,
      prev: json['prev'] != null
          ? ManagersAccountLink.fromJson(json['prev'])
          : null,
      next: json['next'] != null
          ? ManagersAccountLink.fromJson(json['next'])
          : null,
    );
  }

  @override
  List<Object?> get props => [first, last, prev, next];
}
