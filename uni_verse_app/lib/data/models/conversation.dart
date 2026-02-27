import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile.dart';
import 'message.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const Conversation._();

  const factory Conversation({
    required String id,
    @JsonKey(name: 'is_group') @Default(false) bool isGroup,
    @JsonKey(name: 'group_name') String? groupName,
    @JsonKey(name: 'group_avatar_url') String? groupAvatarUrl,
    @JsonKey(name: 'last_message_at') DateTime? lastMessageAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Joined data
    @Default([]) List<ConversationParticipant> participants,
    Message? lastMessage,
    @Default(0) int unreadCount,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  /// Get display name (group name or other participant's name)
  String displayName(String currentUserId) {
    if (isGroup && groupName != null) return groupName!;
    final other = participants.firstWhere(
      (p) => p.userId != currentUserId,
      orElse: () => participants.first,
    );
    return other.profile?.name ?? 'Unknown';
  }

  /// Get display avatar URL
  String? displayAvatar(String currentUserId) {
    if (isGroup) return groupAvatarUrl;
    final other = participants.firstWhere(
      (p) => p.userId != currentUserId,
      orElse: () => participants.first,
    );
    return other.profile?.avatarUrl;
  }

  /// Check if conversation has unread messages
  bool get hasUnread => unreadCount > 0;
}

@freezed
class ConversationParticipant with _$ConversationParticipant {
  const factory ConversationParticipant({
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'unread_count') @Default(0) int unreadCount,
    @JsonKey(name: 'last_read_at') DateTime? lastReadAt,
    @JsonKey(name: 'joined_at') DateTime? joinedAt,
    UserProfile? profile,
  }) = _ConversationParticipant;

  factory ConversationParticipant.fromJson(Map<String, dynamic> json) =>
      _$ConversationParticipantFromJson(json);
}
