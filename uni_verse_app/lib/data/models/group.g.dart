// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  universityId: json['university_id'] as String?,
  university: json['university'] == null
      ? null
      : University.fromJson(json['university'] as Map<String, dynamic>),
  description: json['description'] as String?,
  coverImageUrl: json['cover_image_url'] as String?,
  category:
      $enumDecodeNullable(_$GroupCategoryEnumMap, json['category']) ??
      GroupCategory.general,
  memberCount: (json['member_count'] as num?)?.toInt() ?? 0,
  createdBy: json['created_by'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  members:
      (json['members'] as List<dynamic>?)
          ?.map((e) => GroupMember.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isJoined: json['isJoined'] as bool? ?? false,
);

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'university_id': instance.universityId,
      'university': instance.university,
      'description': instance.description,
      'cover_image_url': instance.coverImageUrl,
      'category': _$GroupCategoryEnumMap[instance.category]!,
      'member_count': instance.memberCount,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'members': instance.members,
      'isJoined': instance.isJoined,
    };

const _$GroupCategoryEnumMap = {
  GroupCategory.course: 'course',
  GroupCategory.club: 'club',
  GroupCategory.studyGroup: 'study-group',
  GroupCategory.general: 'general',
};

_$GroupMemberImpl _$$GroupMemberImplFromJson(Map<String, dynamic> json) =>
    _$GroupMemberImpl(
      groupId: json['group_id'] as String,
      userId: json['user_id'] as String,
      role: json['role'] as String? ?? 'member',
      joinedAt: json['joined_at'] == null
          ? null
          : DateTime.parse(json['joined_at'] as String),
      profile: json['profile'] == null
          ? null
          : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GroupMemberImplToJson(_$GroupMemberImpl instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'role': instance.role,
      'joined_at': instance.joinedAt?.toIso8601String(),
      'profile': instance.profile,
    };
