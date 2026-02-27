// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) {
  return _AppNotification.fromJson(json);
}

/// @nodoc
mixin _$AppNotification {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'actor_id')
  String? get actorId => throw _privateConstructorUsedError;
  UserProfile? get actor => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  String? get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_id')
  String? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  String? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppNotificationCopyWith<AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
    AppNotification value,
    $Res Function(AppNotification) then,
  ) = _$AppNotificationCopyWithImpl<$Res, AppNotification>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'actor_id') String? actorId,
    UserProfile? actor,
    NotificationType type,
    String? content,
    @JsonKey(name: 'post_id') String? postId,
    @JsonKey(name: 'comment_id') String? commentId,
    @JsonKey(name: 'group_id') String? groupId,
    @JsonKey(name: 'is_read') bool isRead,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  });

  $UserProfileCopyWith<$Res>? get actor;
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res, $Val extends AppNotification>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? actorId = freezed,
    Object? actor = freezed,
    Object? type = null,
    Object? content = freezed,
    Object? postId = freezed,
    Object? commentId = freezed,
    Object? groupId = freezed,
    Object? isRead = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            actorId: freezed == actorId
                ? _value.actorId
                : actorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            actor: freezed == actor
                ? _value.actor
                : actor // ignore: cast_nullable_to_non_nullable
                      as UserProfile?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as NotificationType,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            postId: freezed == postId
                ? _value.postId
                : postId // ignore: cast_nullable_to_non_nullable
                      as String?,
            commentId: freezed == commentId
                ? _value.commentId
                : commentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            groupId: freezed == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRead: null == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get actor {
    if (_value.actor == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.actor!, (value) {
      return _then(_value.copyWith(actor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppNotificationImplCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$$AppNotificationImplCopyWith(
    _$AppNotificationImpl value,
    $Res Function(_$AppNotificationImpl) then,
  ) = __$$AppNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'actor_id') String? actorId,
    UserProfile? actor,
    NotificationType type,
    String? content,
    @JsonKey(name: 'post_id') String? postId,
    @JsonKey(name: 'comment_id') String? commentId,
    @JsonKey(name: 'group_id') String? groupId,
    @JsonKey(name: 'is_read') bool isRead,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  });

  @override
  $UserProfileCopyWith<$Res>? get actor;
}

/// @nodoc
class __$$AppNotificationImplCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res, _$AppNotificationImpl>
    implements _$$AppNotificationImplCopyWith<$Res> {
  __$$AppNotificationImplCopyWithImpl(
    _$AppNotificationImpl _value,
    $Res Function(_$AppNotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? actorId = freezed,
    Object? actor = freezed,
    Object? type = null,
    Object? content = freezed,
    Object? postId = freezed,
    Object? commentId = freezed,
    Object? groupId = freezed,
    Object? isRead = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$AppNotificationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        actorId: freezed == actorId
            ? _value.actorId
            : actorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        actor: freezed == actor
            ? _value.actor
            : actor // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as NotificationType,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        postId: freezed == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as String?,
        commentId: freezed == commentId
            ? _value.commentId
            : commentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        groupId: freezed == groupId
            ? _value.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRead: null == isRead
            ? _value.isRead
            : isRead // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$AppNotificationImpl extends _AppNotification {
  const _$AppNotificationImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'actor_id') this.actorId,
    this.actor,
    required this.type,
    this.content,
    @JsonKey(name: 'post_id') this.postId,
    @JsonKey(name: 'comment_id') this.commentId,
    @JsonKey(name: 'group_id') this.groupId,
    @JsonKey(name: 'is_read') this.isRead = false,
    @JsonKey(name: 'created_at') this.createdAt,
  }) : super._();

  factory _$AppNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppNotificationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'actor_id')
  final String? actorId;
  @override
  final UserProfile? actor;
  @override
  final NotificationType type;
  @override
  final String? content;
  @override
  @JsonKey(name: 'post_id')
  final String? postId;
  @override
  @JsonKey(name: 'comment_id')
  final String? commentId;
  @override
  @JsonKey(name: 'group_id')
  final String? groupId;
  @override
  @JsonKey(name: 'is_read')
  final bool isRead;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AppNotification(id: $id, userId: $userId, actorId: $actorId, actor: $actor, type: $type, content: $content, postId: $postId, commentId: $commentId, groupId: $groupId, isRead: $isRead, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.actorId, actorId) || other.actorId == actorId) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    actorId,
    actor,
    type,
    content,
    postId,
    commentId,
    groupId,
    isRead,
    createdAt,
  );

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      __$$AppNotificationImplCopyWithImpl<_$AppNotificationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppNotificationImplToJson(this);
  }
}

abstract class _AppNotification extends AppNotification {
  const factory _AppNotification({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'actor_id') final String? actorId,
    final UserProfile? actor,
    required final NotificationType type,
    final String? content,
    @JsonKey(name: 'post_id') final String? postId,
    @JsonKey(name: 'comment_id') final String? commentId,
    @JsonKey(name: 'group_id') final String? groupId,
    @JsonKey(name: 'is_read') final bool isRead,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
  }) = _$AppNotificationImpl;
  const _AppNotification._() : super._();

  factory _AppNotification.fromJson(Map<String, dynamic> json) =
      _$AppNotificationImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'actor_id')
  String? get actorId;
  @override
  UserProfile? get actor;
  @override
  NotificationType get type;
  @override
  String? get content;
  @override
  @JsonKey(name: 'post_id')
  String? get postId;
  @override
  @JsonKey(name: 'comment_id')
  String? get commentId;
  @override
  @JsonKey(name: 'group_id')
  String? get groupId;
  @override
  @JsonKey(name: 'is_read')
  bool get isRead;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
