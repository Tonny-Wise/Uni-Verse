// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      postId: json['post_id'] as String,
      authorId: json['author_id'] as String,
      author: json['author'] == null
          ? null
          : UserProfile.fromJson(json['author'] as Map<String, dynamic>),
      content: json['content'] as String,
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isLiked: json['is_liked'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'author_id': instance.authorId,
      'author': instance.author,
      'content': instance.content,
      'likes_count': instance.likesCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_liked': instance.isLiked,
    };
