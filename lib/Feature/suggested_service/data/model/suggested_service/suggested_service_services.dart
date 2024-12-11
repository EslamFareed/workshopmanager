import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_services_pivot.dart';

class SuggestedServiceServices with EquatableMixin {
  final int? serviceId;
  final String? enName;
  final String? arName;
  final String? serviceImage;
  final SuggestedServiceServicesPivot? pivot;

  const SuggestedServiceServices({
    this.serviceId,
    this.enName,
    this.arName,
    this.serviceImage,
    this.pivot,
  });

  factory SuggestedServiceServices.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceServices(
      serviceId: json['service_id'] as int?,
      enName: json['en_name'] as String?,
      arName: json['ar_name'] as String?,
      serviceImage: json['service_image'] as String?,
      pivot: json['pivot'] != null
          ? SuggestedServiceServicesPivot.fromJson(
              json['pivot'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [serviceId, enName, arName, serviceImage, pivot];
}
