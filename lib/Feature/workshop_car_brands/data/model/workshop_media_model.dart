import 'package:equatable/equatable.dart';

class WorkshopMediaModel with EquatableMixin {
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
  final Map<String, dynamic>? generatedConversions;
  final String? originalUrl;
  final String? previewUrl;

  WorkshopMediaModel({
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
    this.generatedConversions,
    this.originalUrl,
    this.previewUrl,
  });

  factory WorkshopMediaModel.fromJson(Map<String, dynamic> json) {
    return WorkshopMediaModel(
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
      generatedConversions: json['generated_conversions'] != null
          ? Map<String, dynamic>.from(json['generated_conversions'])
          : null,
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
        generatedConversions,
        originalUrl,
        previewUrl,
      ];
}
