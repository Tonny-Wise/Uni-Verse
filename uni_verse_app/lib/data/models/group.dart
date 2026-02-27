import 'package:freezed_annotation/freezed_annotation.dart';
import 'university.dart';
import 'user_profile.dart';

part 'group.freezed.dart';
part 'group.g.dart';

enum GroupCategory {
  course,
  club,
  @JsonValue('study-group')
  studyGroup,
  general,
}

@freezed
class Group with _$Group {
  const Group._();

  const factory Group({
    required String id,
    required String name,
    @JsonKey(name: 'university_id') String? universityId,
    University? university,
    String? description,
    @JsonKey(name: 'cover_image_url') String? coverImageUrl,
    @Default(GroupCategory.general) GroupCategory category,
    @JsonKey(name: 'member_count') @Default(0) int memberCount,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    // Joined data
    @Default([]) List<GroupMember> members,
    @Default(false) bool isJoined,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  /// Get category display name
  String get categoryName {
    switch (category) {
      case GroupCategory.course:
        return 'Course';
      case GroupCategory.club:
        return 'Club';
      case GroupCategory.studyGroup:
        return 'Study Group';
      case GroupCategory.general:
        return 'General';
    }
  }

  /// Get preview members (first 3)
  List<GroupMember> get previewMembers => members.take(3).toList();

  /// Get remaining member count for preview
  int get remainingMemberCount =>
      memberCount > 3 ? memberCount - 3 : 0;
}

@freezed
class GroupMember with _$GroupMember {
  const factory GroupMember({
    @JsonKey(name: 'group_id') required String groupId,
    @JsonKey(name: 'user_id') required String userId,
    @Default('member') String role,
    @JsonKey(name: 'joined_at') DateTime? joinedAt,
    UserProfile? profile,
  }) = _GroupMember;

  factory GroupMember.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberFromJson(json);
}
