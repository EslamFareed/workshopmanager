import 'package:equatable/equatable.dart';

class SuggestedServiceCarModel with EquatableMixin {
  final int? id;
  final String? arName;
  final String? enName;

  const SuggestedServiceCarModel({this.id, this.arName, this.enName});

  factory SuggestedServiceCarModel.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceCarModel(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, arName, enName];
}
