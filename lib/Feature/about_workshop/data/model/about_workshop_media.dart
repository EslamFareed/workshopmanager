import 'package:equatable/equatable.dart';

class AboutWorkshopMedia with EquatableMixin {
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
  final List<dynamic>? manipulations;
  final Map<String, dynamic>? customProperties;
  final Map<String, bool>? generatedConversions;
  final List<dynamic>? responsiveImages;
  final int? orderColumn;
  final String? createdAt;
  final String? updatedAt;
  final String? originalUrl;
  final String? previewUrl;

  const AboutWorkshopMedia({
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
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.originalUrl,
    this.previewUrl,
  });

  factory AboutWorkshopMedia.fromJson(Map<String, dynamic> json) {
    return AboutWorkshopMedia(
      id: json['id'] as int?,
      modelType: json['model_type'] as String?,
      modelId: json['model_id'] as int?,
      uuid: json['uuid'] as String?,
      collectionName: json['collection_name'] as String?,
      name: json['name'] as String?,
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'] as String?,
      disk: json['disk'] as String?,
      conversionsDisk: json['conversions_disk'] as String?,
      size: json['size'] as int?,
      manipulations: json['manipulations'] as List<dynamic>?,
      customProperties: json['custom_properties'] as Map<String, dynamic>?,
      generatedConversions:
          (json['generated_conversions'] as Map<String, dynamic>?)
              ?.map((key, value) => MapEntry(key, value as bool)),
      responsiveImages: json['responsive_images'] as List<dynamic>?,
      orderColumn: json['order_column'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      originalUrl: json['original_url'] as String?,
      previewUrl: json['preview_url'] as String?,
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
        manipulations,
        customProperties,
        generatedConversions,
        responsiveImages,
        orderColumn,
        createdAt,
        updatedAt,
        originalUrl,
        previewUrl,
      ];
}
