import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/workshop_orders/data/model/workshop_order_meta_link.dart';

class WorkshopOrderMetaLinks with EquatableMixin {
  final WorkshopOrderMetaLink? first;
  final WorkshopOrderMetaLink? last;
  final WorkshopOrderMetaLink? prev;
  final WorkshopOrderMetaLink? next;

  const WorkshopOrderMetaLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory WorkshopOrderMetaLinks.fromJson(Map<String, dynamic> json) {
    return WorkshopOrderMetaLinks(
      first: json['first'] != null
          ? WorkshopOrderMetaLink.fromJson(
              json['first'] as Map<String, dynamic>)
          : null,
      last: json['last'] != null
          ? WorkshopOrderMetaLink.fromJson(json['last'] as Map<String, dynamic>)
          : null,
      prev: json['prev'] != null
          ? WorkshopOrderMetaLink.fromJson(json['prev'] as Map<String, dynamic>)
          : null,
      next: json['next'] != null
          ? WorkshopOrderMetaLink.fromJson(json['next'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [first, last, prev, next];
}
