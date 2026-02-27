import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile.dart';

part 'message.freezed.dart';
part 'message.g.dart';

enum MessageType {
  text,
  image,
  file,
  voice,
}

@freezed
class Message with _$Message {
  const Message._();

  const factory Message({
    required String id,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'sender_id') required String senderId,
    UserProfile? sender,
    String? content,
    @Default(MessageType.text) MessageType type,
    @JsonKey(name: 'file_url') String? fileUrl,
    @JsonKey(name: 'reply_to_id') String? replyToId,
    Message? replyTo,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(false) bool isRead,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  /// Check if message is from current user
  bool isFromUser(String userId) => senderId == userId;

  /// Get formatted time
  String get formattedTime {
    if (createdAt == null) return '';
    final hour = createdAt!.hour.toString().padLeft(2, '0');
    final minute = createdAt!.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Check if message has media
  bool get hasMedia => type == MessageType.image || type == MessageType.file;

  /// Check if message is a reply
  bool get isReply => replyToId != null;
}
