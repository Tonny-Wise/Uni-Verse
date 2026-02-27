// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
  id: json['id'] as String,
  authorId: json['author_id'] as String,
  author: json['author'] == null
      ? null
      : UserProfile.fromJson(json['author'] as Map<String, dynamic>),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  expiresAt: json['expires_at'] == null
      ? null
      : DateTime.parse(json['expires_at'] as String),
  slides:
      (json['slides'] as List<dynamic>?)
          ?.map((e) => StorySlide.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  viewed: json['viewed'] as bool? ?? false,
);

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_id': instance.authorId,
      'author': instance.author,
      'created_at': instance.createdAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'slides': instance.slides,
      'viewed': instance.viewed,
    };

_$StorySlideImpl _$$StorySlideImplFromJson(Map<String, dynamic> json) =>
    _$StorySlideImpl(
      id: json['id'] as String,
      storyId: json['story_id'] as String,
      imageUrl: json['image_url'] as String,
      caption: json['caption'] as String?,
      orderIndex: (json['order_index'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$StorySlideImplToJson(_$StorySlideImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'story_id': instance.storyId,
      'image_url': instance.imageUrl,
      'caption': instance.caption,
      'order_index': instance.orderIndex,
      'created_at': instance.createdAt?.toIso8601String(),
    };
