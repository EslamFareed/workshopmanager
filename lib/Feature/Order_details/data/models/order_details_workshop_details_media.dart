import 'package:equatable/equatable.dart';

class OrderDetailsWorkshopDetailsMedia with EquatableMixin {
  final int? id;
  final String? name;
  final String? fileName;
  final String? mimeType;
  final String? url;

  const OrderDetailsWorkshopDetailsMedia(
      {this.id, this.name, this.fileName, this.mimeType, this.url});

  factory OrderDetailsWorkshopDetailsMedia.fromJson(Map<String, dynamic> json) {
    return OrderDetailsWorkshopDetailsMedia(
      id: json['id'],
      name: json['name'],
      fileName: json['file_name'],
      mimeType: json['mime_type'],
      url: json['url'],
    );
  }

  @override
  List<Object?> get props => [id, name, fileName, mimeType, url];
}
