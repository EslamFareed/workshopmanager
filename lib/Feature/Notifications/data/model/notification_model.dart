import 'package:equatable/equatable.dart';

class NotficationsModel with EquatableMixin {
  int? id;
  int? userId;
  String? title;
  String? body;
  String? arTitle;
  String? arBody;
  String? type;
  int? targetId;
  int? isRead;
  int? isAction;
  int? isHidden;
  String? createdAt;
  String? updatedAt;

  NotficationsModel({
    this.id,
    this.userId,
    this.title,
    this.body,
    this.arTitle,
    this.arBody,
    this.type,
    this.targetId,
    this.isRead,
    this.isAction,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        body,
        arTitle,
        arBody,
        type,
        targetId,
        isRead,
        isAction,
        isHidden,
        createdAt,
        updatedAt
      ];

  factory NotficationsModel.fromJson(Map<String, dynamic> json) {
    return NotficationsModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      arTitle: json['ar_title'] as String?,
      arBody: json['ar_body'] as String?,
      type: json['type'] as String?,
      targetId: json['target_id'] as int?,
      isRead: json['is_read'] as int?,
      isAction: json['is_action'] as int?,
      isHidden: json['is_hidden'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
