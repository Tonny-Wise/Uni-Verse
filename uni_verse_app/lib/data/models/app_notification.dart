import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile.dart';

part 'app_notification.freezed.dart';
part 'app_notification.g.dart';

enum NotificationType {
  like,
  comment,
  follow,
  @JsonValue('group-invite')
  groupInvite,
  mention,
  message,
}

@freezed
class AppNotification with _$AppNotification {
  const AppNotification._();

  const factory AppNotification({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'actor_id') String? actorId,
    UserProfile? actor,
    required NotificationType type,
    String? content,
    @JsonKey(name: 'post_id') String? postId,
    @JsonKey(name: 'comment_id') String? commentId,
    @JsonKey(name: 'group_id') String? groupId,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

  /// Get formatted time ago
  String get timeAgo {
    if (createdAt == null) return '';
    final diff = DateTime.now().difference(createdAt!);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'now';
  }

  /// Check if notification is actionable (requires follow-back, join group, etc.)
  bool get isActionable =>
      type == NotificationType.follow || type == NotificationType.groupInvite;
}
