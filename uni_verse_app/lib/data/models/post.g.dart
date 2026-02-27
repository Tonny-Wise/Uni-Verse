// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
  id: json['id'] as String,
  authorId: json['author_id'] as String,
  author: json['author'] == null
      ? null
      : UserProfile.fromJson(json['author'] as Map<String, dynamic>),
  content: json['content'] as String,
  type: $enumDecodeNullable(_$PostTypeEnumMap, json['type']) ?? PostType.text,
  groupId: json['group_id'] as String?,
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
  sharesCount: (json['shares_count'] as num?)?.toInt() ?? 0,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  comments:
      (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isLiked: json['is_liked'] as bool? ?? false,
  isBookmarked: json['is_bookmarked'] as bool? ?? false,
);

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_id': instance.authorId,
      'author': instance.author,
      'content': instance.content,
      'type': _$PostTypeEnumMap[instance.type]!,
      'group_id': instance.groupId,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'shares_count': instance.sharesCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'images': instance.images,
      'comments': instance.comments,
      'is_liked': instance.isLiked,
      'is_bookmarked': instance.isBookmarked,
    };

const _$PostTypeEnumMap = {
  PostType.text: 'text',
  PostType.image: 'image',
  PostType.studyTip: 'study-tip',
  PostType.question: 'question',
};
