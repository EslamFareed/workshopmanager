import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_meta_links.dart';

class WorkshopOrderMeta with EquatableMixin {
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;
  final WorkshopOrderMetaLinks? links;

  const WorkshopOrderMeta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.links,
  });

  factory WorkshopOrderMeta.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderMeta(
      total: json['total'] as int?,
      perPage: json['per_page'] as int?,
      currentPage: json['current_page'] as int?,
      lastPage: json['last_page'] as int?,
      links: json['links'] != null
          ? WorkshopOrderMetaLinks.fromJson(
              json['links'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [total, perPage, currentPage, lastPage, links];
}
