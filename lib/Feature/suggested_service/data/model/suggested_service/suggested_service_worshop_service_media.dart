import 'package:equatable/equatable.dart';

class SuggestedServiceWorshopServiceMedia with EquatableMixin {
  final int? id;
  final String? modelType;
  final int? modelId;
  final String? uuid;
  final String? collectionName;
  final String? name;
  final String? fileName;
  final String? mimeType;
  final String? originalUrl;
  final String? previewUrl;

  const SuggestedServiceWorshopServiceMedia({
    this.id,
    this.modelType,
    this.modelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.originalUrl,
    this.previewUrl,
  });

  factory SuggestedServiceWorshopServiceMedia.fromJson(
      Map<String, dynamic> json) {
    return SuggestedServiceWorshopServiceMedia(
      id: json['id'] as int?,
      modelType: json['model_type'] as String?,
      modelId: json['model_id'] as int?,
      uuid: json['uuid'] as String?,
      collectionName: json['collection_name'] as String?,
      name: json['name'] as String?,
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'] as String?,
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
        originalUrl,
        previewUrl,
      ];
}
