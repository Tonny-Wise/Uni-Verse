import 'package:freezed_annotation/freezed_annotation.dart';
import 'university.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required String id,
    required String name,
    required String username,
    String? email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @JsonKey(name: 'university_id') String? universityId,
    University? university,
    String? course,
    int? year,
    String? bio,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'is_online') @Default(false) bool isOnline,
    @JsonKey(name: 'last_seen') DateTime? lastSeen,
    @JsonKey(name: 'followers_count') @Default(0) int followersCount,
    @JsonKey(name: 'following_count') @Default(0) int followingCount,
    @JsonKey(name: 'posts_count') @Default(0) int postsCount,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  /// Get initials from name (e.g., "John Doe" -> "JD")
  String get initials {
    final parts = name.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  /// Get display name with username
  String get displayNameWithUsername => '$name (@$username)';
}
