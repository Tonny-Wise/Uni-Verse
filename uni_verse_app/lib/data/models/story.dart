import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_profile.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const Story._();

  const factory Story({
    required String id,
    @JsonKey(name: 'author_id') required String authorId,
    UserProfile? author,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @Default([]) List<StorySlide> slides,
    @Default(false) bool viewed,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  /// Check if story is expired
  bool get isExpired =>
      expiresAt != null && DateTime.now().isAfter(expiresAt!);

  /// Check if story has slides
  bool get hasSlides => slides.isNotEmpty;
}

@freezed
class StorySlide with _$StorySlide {
  const factory StorySlide({
    required String id,
    @JsonKey(name: 'story_id') required String storyId,
    @JsonKey(name: 'image_url') required String imageUrl,
    String? caption,
    @JsonKey(name: 'order_index') @Default(0) int orderIndex,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _StorySlide;

  factory StorySlide.fromJson(Map<String, dynamic> json) =>
      _$StorySlideFromJson(json);
}
