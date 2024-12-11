import 'package:equatable/equatable.dart';

class Government with EquatableMixin {
  int? id;
  String? arName;
  String? enName;

  Government({
    this.id,
    this.arName,
    this.enName,
  });

  @override
  List<Object?> get props => [id, arName, enName];

  factory Government.fromJson(Map<String, dynamic> json) {
    return Government(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }
}
