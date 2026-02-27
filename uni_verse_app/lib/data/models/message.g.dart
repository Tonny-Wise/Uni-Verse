// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      conversationId: json['conversation_id'] as String,
      senderId: json['sender_id'] as String,
      sender: json['sender'] == null
          ? null
          : UserProfile.fromJson(json['sender'] as Map<String, dynamic>),
      content: json['content'] as String?,
      type:
          $enumDecodeNullable(_$MessageTypeEnumMap, json['type']) ??
          MessageType.text,
      fileUrl: json['file_url'] as String?,
      replyToId: json['reply_to_id'] as String?,
      replyTo: json['replyTo'] == null
          ? null
          : Message.fromJson(json['replyTo'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversation_id': instance.conversationId,
      'sender_id': instance.senderId,
      'sender': instance.sender,
      'content': instance.content,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'file_url': instance.fileUrl,
      'reply_to_id': instance.replyToId,
      'replyTo': instance.replyTo,
      'created_at': instance.createdAt?.toIso8601String(),
      'isRead': instance.isRead,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.file: 'file',
  MessageType.voice: 'voice',
};
