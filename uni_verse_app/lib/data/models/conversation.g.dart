// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      id: json['id'] as String,
      isGroup: json['is_group'] as bool? ?? false,
      groupName: json['group_name'] as String?,
      groupAvatarUrl: json['group_avatar_url'] as String?,
      lastMessageAt: json['last_message_at'] == null
          ? null
          : DateTime.parse(json['last_message_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ConversationParticipant.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      lastMessage: json['lastMessage'] == null
          ? null
          : Message.fromJson(json['lastMessage'] as Map<String, dynamic>),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_group': instance.isGroup,
      'group_name': instance.groupName,
      'group_avatar_url': instance.groupAvatarUrl,
      'last_message_at': instance.lastMessageAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'participants': instance.participants,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
    };

_$ConversationParticipantImpl _$$ConversationParticipantImplFromJson(
  Map<String, dynamic> json,
) => _$ConversationParticipantImpl(
  conversationId: json['conversation_id'] as String,
  userId: json['user_id'] as String,
  unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
  lastReadAt: json['last_read_at'] == null
      ? null
      : DateTime.parse(json['last_read_at'] as String),
  joinedAt: json['joined_at'] == null
      ? null
      : DateTime.parse(json['joined_at'] as String),
  profile: json['profile'] == null
      ? null
      : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ConversationParticipantImplToJson(
  _$ConversationParticipantImpl instance,
) => <String, dynamic>{
  'conversation_id': instance.conversationId,
  'user_id': instance.userId,
  'unread_count': instance.unreadCount,
  'last_read_at': instance.lastReadAt?.toIso8601String(),
  'joined_at': instance.joinedAt?.toIso8601String(),
  'profile': instance.profile,
};
