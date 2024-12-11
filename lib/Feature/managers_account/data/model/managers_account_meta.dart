import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/managers_account/data/model/managers_account_link.dart';

class ManagersAccountMeta with EquatableMixin {
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;
  final ManagersAccountLink? links;

  const ManagersAccountMeta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.links,
  });

  factory ManagersAccountMeta.fromJson(Map<String, dynamic> json) {
    return ManagersAccountMeta(
      total: json['total'] as int?,
      perPage: json['per_page'] as int?,
      currentPage: json['current_page'] as int?,
      lastPage: json['last_page'] as int?,
      links: json['links'] != null
          ? ManagersAccountLink.fromJson(json['links'])
          : null,
    );
  }

  @override
  List<Object?> get props => [total, perPage, currentPage, lastPage, links];
}
