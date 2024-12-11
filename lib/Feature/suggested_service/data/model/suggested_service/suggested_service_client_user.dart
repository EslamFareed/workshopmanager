import 'package:equatable/equatable.dart';

class SuggestedServiceClientUser with EquatableMixin {
  final int? id;
  final String? name;
  final String? avatar;

  const SuggestedServiceClientUser({this.id, this.name, this.avatar});

  factory SuggestedServiceClientUser.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceClientUser(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, avatar];
}
