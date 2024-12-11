import 'package:equatable/equatable.dart';

import 'home_workshop_link.dart';

class HomeWorkshopLinkesModel with EquatableMixin {
  final HomeWorkshopLink? first;
  final HomeWorkshopLink? last;
  final HomeWorkshopLink? prev;
  final HomeWorkshopLink? next;

  const HomeWorkshopLinkesModel({this.first, this.last, this.prev, this.next});

  factory HomeWorkshopLinkesModel.fromJson(Map<String, dynamic> json) {
    return HomeWorkshopLinkesModel(
      first: json['first'] != null
          ? HomeWorkshopLink.fromJson(json['first'])
          : null,
      last:
          json['last'] != null ? HomeWorkshopLink.fromJson(json['last']) : null,
      prev:
          json['prev'] != null ? HomeWorkshopLink.fromJson(json['prev']) : null,
      next:
          json['next'] != null ? HomeWorkshopLink.fromJson(json['next']) : null,
    );
  }

  @override
  List<Object?> get props => [first, last, prev, next];
}
