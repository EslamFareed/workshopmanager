import 'package:equatable/equatable.dart';

class AddServiceModel extends Equatable {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? name;
  final String? address;
  final String? geoLat;
  final String? geoLng;
  final String? phone1;
  final String? phone2;
  final String? arDescription;
  final String? enDescription;
  final int? isMain;
  final int? isBusy;
  final int? isActive;
  final int? ordersCapacity;
  final int? freeOrdersSpace;
  final double? starRatingAvg;
  final double? priceRating;
  final double? commissionRatio;
  final int? workShopManagerId;
  final int? goveId;
  final int? distId;
  final int? isAuthorized;
  final String? logo;
  final List<MediaModel>? media;

  const AddServiceModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.address,
    this.geoLat,
    this.geoLng,
    this.phone1,
    this.phone2,
    this.arDescription,
    this.enDescription,
    this.isMain,
    this.isBusy,
    this.isActive,
    this.ordersCapacity,
    this.freeOrdersSpace,
    this.starRatingAvg,
    this.priceRating,
    this.commissionRatio,
    this.workShopManagerId,
    this.goveId,
    this.distId,
    this.isAuthorized,
    this.logo,
    this.media,
  });

  factory AddServiceModel.fromJson(Map<String, dynamic> json) {
    return AddServiceModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      address: json['address'],
      geoLat: json['geo_lat'],
      geoLng: json['geo_lng'],
      phone1: json['phone_1'],
      phone2: json['phone_2'],
      arDescription: json['ar_description'],
      enDescription: json['en_description'],
      isMain: json['is_main'],
      isBusy: json['is_busy'],
      isActive: json['is_active'],
      ordersCapacity: json['orders_capacity'],
      freeOrdersSpace: json['free_orders_space'],
      starRatingAvg: (json['star_rating_avg'] ?? 0).toDouble(),
      priceRating: json['price_rating']?.toDouble(),
      commissionRatio: json['commission_ratio']?.toDouble(),
      workShopManagerId: json['work_shop_manager_id'],
      goveId: json['gove_id'],
      distId: json['dist_id'],
      isAuthorized: json['is_authorized'],
      logo: json['logo'],
      media: (json['media']) != null
          ? List<MediaModel>.from(
              json['services'].map((x) => MediaModel.fromJson(x)))
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        name,
        address,
        geoLat,
        geoLng,
        phone1,
        phone2,
        arDescription,
        enDescription,
        isMain,
        isBusy,
        isActive,
        ordersCapacity,
        freeOrdersSpace,
        starRatingAvg,
        priceRating,
        commissionRatio,
        workShopManagerId,
        goveId,
        distId,
        isAuthorized,
        logo,
        media,
      ];
}

class MediaModel extends Equatable {
  final int? id;
  final String? modelType;
  final int? modelId;
  final String? uuid;
  final String? collectionName;
  final String? name;
  final String? fileName;
  final String? mimeType;
  final String? disk;
  final String? conversionsDisk;
  final int? size;
  final String? createdAt;
  final String? updatedAt;
  final String? originalUrl;
  final String? previewUrl;

  const MediaModel({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.createdAt,
    this.updatedAt,
    this.originalUrl,
    this.previewUrl,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'],
      modelType: json['model_type'],
      modelId: json['model_id'],
      uuid: json['uuid'],
      collectionName: json['collection_name'],
      name: json['name'],
      fileName: json['file_name'],
      mimeType: json['mime_type'],
      disk: json['disk'],
      conversionsDisk: json['conversions_disk'],
      size: json['size'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      originalUrl: json['original_url'],
      previewUrl: json['preview_url'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        modelType,
        modelId,
        uuid,
        collectionName,
        name,
        fileName,
        mimeType,
        disk,
        conversionsDisk,
        size,
        createdAt,
        updatedAt,
        originalUrl,
        previewUrl,
      ];
}
