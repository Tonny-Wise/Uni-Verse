// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoCallImpl _$$VideoCallImplFromJson(Map<String, dynamic> json) =>
    _$VideoCallImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      hostId: json['host_id'] as String,
      host: json['host'] == null
          ? null
          : UserProfile.fromJson(json['host'] as Map<String, dynamic>),
      channelName: json['channel_name'] as String?,
      scheduledAt: json['scheduled_at'] == null
          ? null
          : DateTime.parse(json['scheduled_at'] as String),
      status:
          $enumDecodeNullable(_$CallStatusEnumMap, json['status']) ??
          CallStatus.scheduled,
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      endedAt: json['ended_at'] == null
          ? null
          : DateTime.parse(json['ended_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map((e) => CallParticipant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VideoCallImplToJson(_$VideoCallImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'host_id': instance.hostId,
      'host': instance.host,
      'channel_name': instance.channelName,
      'scheduled_at': instance.scheduledAt?.toIso8601String(),
      'status': _$CallStatusEnumMap[instance.status]!,
      'started_at': instance.startedAt?.toIso8601String(),
      'ended_at': instance.endedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'participants': instance.participants,
    };

const _$CallStatusEnumMap = {
  CallStatus.scheduled: 'scheduled',
  CallStatus.live: 'live',
  CallStatus.ended: 'ended',
};

_$CallParticipantImpl _$$CallParticipantImplFromJson(
  Map<String, dynamic> json,
) => _$CallParticipantImpl(
  callId: json['call_id'] as String,
  userId: json['user_id'] as String,
  joinedAt: json['joined_at'] == null
      ? null
      : DateTime.parse(json['joined_at'] as String),
  leftAt: json['left_at'] == null
      ? null
      : DateTime.parse(json['left_at'] as String),
  profile: json['profile'] == null
      ? null
      : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CallParticipantImplToJson(
  _$CallParticipantImpl instance,
) => <String, dynamic>{
  'call_id': instance.callId,
  'user_id': instance.userId,
  'joined_at': instance.joinedAt?.toIso8601String(),
  'left_at': instance.leftAt?.toIso8601String(),
  'profile': instance.profile,
};
