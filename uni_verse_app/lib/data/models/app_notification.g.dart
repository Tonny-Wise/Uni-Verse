// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppNotificationImpl _$$AppNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$AppNotificationImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  actorId: json['actor_id'] as String?,
  actor: json['actor'] == null
      ? null
      : UserProfile.fromJson(json['actor'] as Map<String, dynamic>),
  type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
  content: json['content'] as String?,
  postId: json['post_id'] as String?,
  commentId: json['comment_id'] as String?,
  groupId: json['group_id'] as String?,
  isRead: json['is_read'] as bool? ?? false,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$AppNotificationImplToJson(
  _$AppNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'actor_id': instance.actorId,
  'actor': instance.actor,
  'type': _$NotificationTypeEnumMap[instance.type]!,
  'content': instance.content,
  'post_id': instance.postId,
  'comment_id': instance.commentId,
  'group_id': instance.groupId,
  'is_read': instance.isRead,
  'created_at': instance.createdAt?.toIso8601String(),
};

const _$NotificationTypeEnumMap = {
  NotificationType.like: 'like',
  NotificationType.comment: 'comment',
  NotificationType.follow: 'follow',
  NotificationType.groupInvite: 'group-invite',
  NotificationType.mention: 'mention',
  NotificationType.message: 'message',
};
