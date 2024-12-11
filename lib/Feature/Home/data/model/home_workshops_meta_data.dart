import 'package:equatable/equatable.dart';

import 'home_workshop_linkes_model.dart';

class HomeWorkshopsMetaData with EquatableMixin {
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;
  final HomeWorkshopLinkesModel? links;

  const HomeWorkshopsMetaData({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.links,
  });

  factory HomeWorkshopsMetaData.fromJson(Map<String, dynamic> json) {
    return HomeWorkshopsMetaData(
      total: json['total'] as int?,
      perPage: json['per_page'] as int?,
      currentPage: json['current_page'] as int?,
      lastPage: json['last_page'] as int?,
      links: json['links'] != null
          ? HomeWorkshopLinkesModel.fromJson(json['links'])
          : null,
    );
  }

  @override
  List<Object?> get props => [total, perPage, currentPage, lastPage, links];
}
