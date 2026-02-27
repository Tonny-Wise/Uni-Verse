import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile.dart';
import 'comment.dart';

part 'post.freezed.dart';
part 'post.g.dart';

enum PostType {
  text,
  image,
  @JsonValue('study-tip')
  studyTip,
  question,
}

@freezed
class Post with _$Post {
  const Post._();

  const factory Post({
    required String id,
    @JsonKey(name: 'author_id') required String authorId,
    UserProfile? author,
    required String content,
    @Default(PostType.text) PostType type,
    @JsonKey(name: 'group_id') String? groupId,
    @JsonKey(name: 'likes_count') @Default(0) int likesCount,
    @JsonKey(name: 'comments_count') @Default(0) int commentsCount,
    @JsonKey(name: 'shares_count') @Default(0) int sharesCount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Joined data
    @Default([]) List<String> images,
    @Default([]) List<Comment> comments,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @JsonKey(name: 'is_bookmarked') @Default(false) bool isBookmarked,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// Check if post has images
  bool get hasImages => images.isNotEmpty;

  /// Check if post is a study tip
  bool get isStudyTip => type == PostType.studyTip;

  /// Check if post is a question
  bool get isQuestion => type == PostType.question;

  /// Get formatted time ago string
  String get timeAgo {
    if (createdAt == null) return '';
    final diff = DateTime.now().difference(createdAt!);
    if (diff.inDays > 0) return '${diff.inDays}d';
    if (diff.inHours > 0) return '${diff.inHours}h';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m';
    return 'now';
  }
}
