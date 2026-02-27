import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const Comment._();

  const factory Comment({
    required String id,
    @JsonKey(name: 'post_id') required String postId,
    @JsonKey(name: 'author_id') required String authorId,
    UserProfile? author,
    required String content,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  /// Get formatted time ago string
  String get timeAgo {
    if (createdAt == null) return '';
    final diff = DateTime.now().difference(createdAt!);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'now';
  }
}
