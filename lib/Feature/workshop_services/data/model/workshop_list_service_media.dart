import "package:equatable/equatable.dart";

class WorkshopListServiceMedia with EquatableMixin {
  int id;
  String modelType;
  int modelId;
  String uuid;
  String collectionName;
  String name;
  String fileName;
  String mimeType;
  String disk;
  String conversionsDisk;
  int size;
  List<dynamic> manipulations;
  List<dynamic> customProperties;
  Map<String, dynamic> generatedConversions;
  List<dynamic> responsiveImages;
  int orderColumn;
  String createdAt;
  String updatedAt;
  String originalUrl;
  String previewUrl;

  WorkshopListServiceMedia({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.uuid,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.conversionsDisk,
    required this.size,
    required this.manipulations,
    required this.customProperties,
    required this.generatedConversions,
    required this.responsiveImages,
    required this.orderColumn,
    required this.createdAt,
    required this.updatedAt,
    required this.originalUrl,
    required this.previewUrl,
  });

  factory WorkshopListServiceMedia.fromJson(Map<String, dynamic> json) {
    return WorkshopListServiceMedia(
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
      manipulations: List<dynamic>.from(json['manipulations']),
      customProperties: List<dynamic>.from(json['custom_properties']),
      generatedConversions:
          Map<String, dynamic>.from(json['generated_conversions']),
      responsiveImages: List<dynamic>.from(json['responsive_images']),
      orderColumn: json['order_column'],
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
