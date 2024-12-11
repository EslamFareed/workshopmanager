import 'package:equatable/equatable.dart';

class Center with EquatableMixin {
  int? id;
  String? arName;
  String? enName;

  Center({
    this.id,
    this.arName,
    this.enName,
  });

  @override
  List<Object?> get props => [id, arName, enName];

  factory Center.fromJson(Map<String, dynamic> json) {
    return Center(
      id: json['id'] as int?,
      arName: json['ar_name'] as String?,
      enName: json['en_name'] as String?,
    );
  }
}
