import 'package:equatable/equatable.dart';
import 'package:workshopmanager/Feature/suggested_service/data/model/suggested_service/suggested_service_client_user.dart';

class SuggestedServiceClient with EquatableMixin {
  final int? id;
  final SuggestedServiceClientUser? user;

  const SuggestedServiceClient({this.id, this.user});

  factory SuggestedServiceClient.fromJson(Map<String, dynamic> json) {
    return SuggestedServiceClient(
      id: json['id'] as int?,
      user: json['user'] != null
          ? SuggestedServiceClientUser.fromJson(
              json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, user];
}
