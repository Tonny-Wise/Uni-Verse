// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      coverUrl: json['cover_url'] as String?,
      universityId: json['university_id'] as String?,
      university: json['university'] == null
          ? null
          : University.fromJson(json['university'] as Map<String, dynamic>),
      course: json['course'] as String?,
      year: (json['year'] as num?)?.toInt(),
      bio: json['bio'] as String?,
      isVerified: json['is_verified'] as bool? ?? false,
      isOnline: json['is_online'] as bool? ?? false,
      lastSeen: json['last_seen'] == null
          ? null
          : DateTime.parse(json['last_seen'] as String),
      followersCount: (json['followers_count'] as num?)?.toInt() ?? 0,
      followingCount: (json['following_count'] as num?)?.toInt() ?? 0,
      postsCount: (json['posts_count'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'cover_url': instance.coverUrl,
      'university_id': instance.universityId,
      'university': instance.university,
      'course': instance.course,
      'year': instance.year,
      'bio': instance.bio,
      'is_verified': instance.isVerified,
      'is_online': instance.isOnline,
      'last_seen': instance.lastSeen?.toIso8601String(),
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'posts_count': instance.postsCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
