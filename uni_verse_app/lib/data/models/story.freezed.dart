// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
mixin _$Story {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_id')
  String get authorId => throw _privateConstructorUsedError;
  UserProfile? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  List<StorySlide> get slides => throw _privateConstructorUsedError;
  bool get viewed => throw _privateConstructorUsedError;

  /// Serializes this Story to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res, Story>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'author_id') String authorId,
    UserProfile? author,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    List<StorySlide> slides,
    bool viewed,
  });

  $UserProfileCopyWith<$Res>? get author;
}

/// @nodoc
class _$StoryCopyWithImpl<$Res, $Val extends Story>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? slides = null,
    Object? viewed = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            author: freezed == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as UserProfile?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            slides: null == slides
                ? _value.slides
                : slides // ignore: cast_nullable_to_non_nullable
                      as List<StorySlide>,
            viewed: null == viewed
                ? _value.viewed
                : viewed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryImplCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$$StoryImplCopyWith(
    _$StoryImpl value,
    $Res Function(_$StoryImpl) then,
  ) = __$$StoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'author_id') String authorId,
    UserProfile? author,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    List<StorySlide> slides,
    bool viewed,
  });

  @override
  $UserProfileCopyWith<$Res>? get author;
}

/// @nodoc
class __$$StoryImplCopyWithImpl<$Res>
    extends _$StoryCopyWithImpl<$Res, _$StoryImpl>
    implements _$$StoryImplCopyWith<$Res> {
  __$$StoryImplCopyWithImpl(
    _$StoryImpl _value,
    $Res Function(_$StoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? author = freezed,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? slides = null,
    Object? viewed = null,
  }) {
    return _then(
      _$StoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        author: freezed == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        slides: null == slides
            ? _value._slides
            : slides // ignore: cast_nullable_to_non_nullable
                  as List<StorySlide>,
        viewed: null == viewed
            ? _value.viewed
            : viewed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryImpl extends _Story {
  const _$StoryImpl({
    required this.id,
    @JsonKey(name: 'author_id') required this.authorId,
    this.author,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'expires_at') this.expiresAt,
    final List<StorySlide> slides = const [],
    this.viewed = false,
  }) : _slides = slides,
       super._();

  factory _$StoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'author_id')
  final String authorId;
  @override
  final UserProfile? author;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  final List<StorySlide> _slides;
  @override
  @JsonKey()
  List<StorySlide> get slides {
    if (_slides is EqualUnmodifiableListView) return _slides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slides);
  }

  @override
  @JsonKey()
  final bool viewed;

  @override
  String toString() {
    return 'Story(id: $id, authorId: $authorId, author: $author, createdAt: $createdAt, expiresAt: $expiresAt, slides: $slides, viewed: $viewed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality().equals(other._slides, _slides) &&
            (identical(other.viewed, viewed) || other.viewed == viewed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    authorId,
    author,
    createdAt,
    expiresAt,
    const DeepCollectionEquality().hash(_slides),
    viewed,
  );

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      __$$StoryImplCopyWithImpl<_$StoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryImplToJson(this);
  }
}

abstract class _Story extends Story {
  const factory _Story({
    required final String id,
    @JsonKey(name: 'author_id') required final String authorId,
    final UserProfile? author,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'expires_at') final DateTime? expiresAt,
    final List<StorySlide> slides,
    final bool viewed,
  }) = _$StoryImpl;
  const _Story._() : super._();

  factory _Story.fromJson(Map<String, dynamic> json) = _$StoryImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'author_id')
  String get authorId;
  @override
  UserProfile? get author;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @override
  List<StorySlide> get slides;
  @override
  bool get viewed;

  /// Create a copy of Story
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryImplCopyWith<_$StoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StorySlide _$StorySlideFromJson(Map<String, dynamic> json) {
  return _StorySlide.fromJson(json);
}

/// @nodoc
mixin _$StorySlide {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'story_id')
  String get storyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_index')
  int get orderIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this StorySlide to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorySlide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorySlideCopyWith<StorySlide> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorySlideCopyWith<$Res> {
  factory $StorySlideCopyWith(
    StorySlide value,
    $Res Function(StorySlide) then,
  ) = _$StorySlideCopyWithImpl<$Res, StorySlide>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'story_id') String storyId,
    @JsonKey(name: 'image_url') String imageUrl,
    String? caption,
    @JsonKey(name: 'order_index') int orderIndex,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  });
}

/// @nodoc
class _$StorySlideCopyWithImpl<$Res, $Val extends StorySlide>
    implements $StorySlideCopyWith<$Res> {
  _$StorySlideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorySlide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storyId = null,
    Object? imageUrl = null,
    Object? caption = freezed,
    Object? orderIndex = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            storyId: null == storyId
                ? _value.storyId
                : storyId // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
            orderIndex: null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StorySlideImplCopyWith<$Res>
    implements $StorySlideCopyWith<$Res> {
  factory _$$StorySlideImplCopyWith(
    _$StorySlideImpl value,
    $Res Function(_$StorySlideImpl) then,
  ) = __$$StorySlideImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'story_id') String storyId,
    @JsonKey(name: 'image_url') String imageUrl,
    String? caption,
    @JsonKey(name: 'order_index') int orderIndex,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  });
}

/// @nodoc
class __$$StorySlideImplCopyWithImpl<$Res>
    extends _$StorySlideCopyWithImpl<$Res, _$StorySlideImpl>
    implements _$$StorySlideImplCopyWith<$Res> {
  __$$StorySlideImplCopyWithImpl(
    _$StorySlideImpl _value,
    $Res Function(_$StorySlideImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StorySlide
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? storyId = null,
    Object? imageUrl = null,
    Object? caption = freezed,
    Object? orderIndex = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$StorySlideImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        storyId: null == storyId
            ? _value.storyId
            : storyId // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
        orderIndex: null == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StorySlideImpl implements _StorySlide {
  const _$StorySlideImpl({
    required this.id,
    @JsonKey(name: 'story_id') required this.storyId,
    @JsonKey(name: 'image_url') required this.imageUrl,
    this.caption,
    @JsonKey(name: 'order_index') this.orderIndex = 0,
    @JsonKey(name: 'created_at') this.createdAt,
  });

  factory _$StorySlideImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorySlideImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'story_id')
  final String storyId;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  @override
  final String? caption;
  @override
  @JsonKey(name: 'order_index')
  final int orderIndex;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'StorySlide(id: $id, storyId: $storyId, imageUrl: $imageUrl, caption: $caption, orderIndex: $orderIndex, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorySlideImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storyId, storyId) || other.storyId == storyId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    storyId,
    imageUrl,
    caption,
    orderIndex,
    createdAt,
  );

  /// Create a copy of StorySlide
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorySlideImplCopyWith<_$StorySlideImpl> get copyWith =>
      __$$StorySlideImplCopyWithImpl<_$StorySlideImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StorySlideImplToJson(this);
  }
}

abstract class _StorySlide implements StorySlide {
  const factory _StorySlide({
    required final String id,
    @JsonKey(name: 'story_id') required final String storyId,
    @JsonKey(name: 'image_url') required final String imageUrl,
    final String? caption,
    @JsonKey(name: 'order_index') final int orderIndex,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
  }) = _$StorySlideImpl;

  factory _StorySlide.fromJson(Map<String, dynamic> json) =
      _$StorySlideImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'story_id')
  String get storyId;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  String? get caption;
  @override
  @JsonKey(name: 'order_index')
  int get orderIndex;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of StorySlide
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorySlideImplCopyWith<_$StorySlideImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
