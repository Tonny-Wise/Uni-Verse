import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile.dart';

part 'video_call.freezed.dart';
part 'video_call.g.dart';

enum CallStatus {
  scheduled,
  live,
  ended,
}

@freezed
class VideoCall with _$VideoCall {
  const VideoCall._();

  const factory VideoCall({
    required String id,
    required String title,
    @JsonKey(name: 'host_id') required String hostId,
    UserProfile? host,
    @JsonKey(name: 'channel_name') String? channelName,
    @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
    @Default(CallStatus.scheduled) CallStatus status,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'ended_at') DateTime? endedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    // Joined data
    @Default([]) List<CallParticipant> participants,
  }) = _VideoCall;

  factory VideoCall.fromJson(Map<String, dynamic> json) =>
      _$VideoCallFromJson(json);

  /// Check if call is live
  bool get isLive => status == CallStatus.live;

  /// Check if call is scheduled
  bool get isScheduled => status == CallStatus.scheduled;

  /// Check if call has ended
  bool get isEnded => status == CallStatus.ended;

  /// Get call duration
  String? get duration {
    if (startedAt == null || endedAt == null) return null;
    final diff = endedAt!.difference(startedAt!);
    final hours = diff.inHours;
    final minutes = diff.inMinutes.remainder(60);
    final seconds = diff.inSeconds.remainder(60);
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  /// Get participant count
  int get participantCount => participants.length;

  /// Get preview participants (first 4)
  List<CallParticipant> get previewParticipants => participants.take(4).toList();
}

@freezed
class CallParticipant with _$CallParticipant {
  const factory CallParticipant({
    @JsonKey(name: 'call_id') required String callId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'joined_at') DateTime? joinedAt,
    @JsonKey(name: 'left_at') DateTime? leftAt,
    UserProfile? profile,
  }) = _CallParticipant;

  factory CallParticipant.fromJson(Map<String, dynamic> json) =>
      _$CallParticipantFromJson(json);
}
