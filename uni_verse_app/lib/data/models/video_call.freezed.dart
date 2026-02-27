// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VideoCall _$VideoCallFromJson(Map<String, dynamic> json) {
  return _VideoCall.fromJson(json);
}

/// @nodoc
mixin _$VideoCall {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'host_id')
  String get hostId => throw _privateConstructorUsedError;
  UserProfile? get host => throw _privateConstructorUsedError;
  @JsonKey(name: 'channel_name')
  String? get channelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_at')
  DateTime? get scheduledAt => throw _privateConstructorUsedError;
  CallStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  DateTime? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ended_at')
  DateTime? get endedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError; // Joined data
  List<CallParticipant> get participants => throw _privateConstructorUsedError;

  /// Serializes this VideoCall to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoCall
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoCallCopyWith<VideoCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallCopyWith<$Res> {
  factory $VideoCallCopyWith(VideoCall value, $Res Function(VideoCall) then) =
      _$VideoCallCopyWithImpl<$Res, VideoCall>;
  @useResult
  $Res call({
    String id,
    String title,
    @JsonKey(name: 'host_id') String hostId,
    UserProfile? host,
    @JsonKey(name: 'channel_name') String? channelName,
    @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
    CallStatus status,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'ended_at') DateTime? endedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    List<CallParticipant> participants,
  });

  $UserProfileCopyWith<$Res>? get host;
}

/// @nodoc
class _$VideoCallCopyWithImpl<$Res, $Val extends VideoCall>
    implements $VideoCallCopyWith<$Res> {
  _$VideoCallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoCall
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? hostId = null,
    Object? host = freezed,
    Object? channelName = freezed,
    Object? scheduledAt = freezed,
    Object? status = null,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? createdAt = freezed,
    Object? participants = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            hostId: null == hostId
                ? _value.hostId
                : hostId // ignore: cast_nullable_to_non_nullable
                      as String,
            host: freezed == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                      as UserProfile?,
            channelName: freezed == channelName
                ? _value.channelName
                : channelName // ignore: cast_nullable_to_non_nullable
                      as String?,
            scheduledAt: freezed == scheduledAt
                ? _value.scheduledAt
                : scheduledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CallStatus,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endedAt: freezed == endedAt
                ? _value.endedAt
                : endedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            participants: null == participants
                ? _value.participants
                : participants // ignore: cast_nullable_to_non_nullable
                      as List<CallParticipant>,
          )
          as $Val,
    );
  }

  /// Create a copy of VideoCall
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get host {
    if (_value.host == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.host!, (value) {
      return _then(_value.copyWith(host: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VideoCallImplCopyWith<$Res>
    implements $VideoCallCopyWith<$Res> {
  factory _$$VideoCallImplCopyWith(
    _$VideoCallImpl value,
    $Res Function(_$VideoCallImpl) then,
  ) = __$$VideoCallImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    @JsonKey(name: 'host_id') String hostId,
    UserProfile? host,
    @JsonKey(name: 'channel_name') String? channelName,
    @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
    CallStatus status,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'ended_at') DateTime? endedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    List<CallParticipant> participants,
  });

  @override
  $UserProfileCopyWith<$Res>? get host;
}

/// @nodoc
class __$$VideoCallImplCopyWithImpl<$Res>
    extends _$VideoCallCopyWithImpl<$Res, _$VideoCallImpl>
    implements _$$VideoCallImplCopyWith<$Res> {
  __$$VideoCallImplCopyWithImpl(
    _$VideoCallImpl _value,
    $Res Function(_$VideoCallImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoCall
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? hostId = null,
    Object? host = freezed,
    Object? channelName = freezed,
    Object? scheduledAt = freezed,
    Object? status = null,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? createdAt = freezed,
    Object? participants = null,
  }) {
    return _then(
      _$VideoCallImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        hostId: null == hostId
            ? _value.hostId
            : hostId // ignore: cast_nullable_to_non_nullable
                  as String,
        host: freezed == host
            ? _value.host
            : host // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
        channelName: freezed == channelName
            ? _value.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String?,
        scheduledAt: freezed == scheduledAt
            ? _value.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CallStatus,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endedAt: freezed == endedAt
            ? _value.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        participants: null == participants
            ? _value._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<CallParticipant>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoCallImpl extends _VideoCall {
  const _$VideoCallImpl({
    required this.id,
    required this.title,
    @JsonKey(name: 'host_id') required this.hostId,
    this.host,
    @JsonKey(name: 'channel_name') this.channelName,
    @JsonKey(name: 'scheduled_at') this.scheduledAt,
    this.status = CallStatus.scheduled,
    @JsonKey(name: 'started_at') this.startedAt,
    @JsonKey(name: 'ended_at') this.endedAt,
    @JsonKey(name: 'created_at') this.createdAt,
    final List<CallParticipant> participants = const [],
  }) : _participants = participants,
       super._();

  factory _$VideoCallImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoCallImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey(name: 'host_id')
  final String hostId;
  @override
  final UserProfile? host;
  @override
  @JsonKey(name: 'channel_name')
  final String? channelName;
  @override
  @JsonKey(name: 'scheduled_at')
  final DateTime? scheduledAt;
  @override
  @JsonKey()
  final CallStatus status;
  @override
  @JsonKey(name: 'started_at')
  final DateTime? startedAt;
  @override
  @JsonKey(name: 'ended_at')
  final DateTime? endedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  // Joined data
  final List<CallParticipant> _participants;
  // Joined data
  @override
  @JsonKey()
  List<CallParticipant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'VideoCall(id: $id, title: $title, hostId: $hostId, host: $host, channelName: $channelName, scheduledAt: $scheduledAt, status: $status, startedAt: $startedAt, endedAt: $endedAt, createdAt: $createdAt, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoCallImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    hostId,
    host,
    channelName,
    scheduledAt,
    status,
    startedAt,
    endedAt,
    createdAt,
    const DeepCollectionEquality().hash(_participants),
  );

  /// Create a copy of VideoCall
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoCallImplCopyWith<_$VideoCallImpl> get copyWith =>
      __$$VideoCallImplCopyWithImpl<_$VideoCallImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoCallImplToJson(this);
  }
}

abstract class _VideoCall extends VideoCall {
  const factory _VideoCall({
    required final String id,
    required final String title,
    @JsonKey(name: 'host_id') required final String hostId,
    final UserProfile? host,
    @JsonKey(name: 'channel_name') final String? channelName,
    @JsonKey(name: 'scheduled_at') final DateTime? scheduledAt,
    final CallStatus status,
    @JsonKey(name: 'started_at') final DateTime? startedAt,
    @JsonKey(name: 'ended_at') final DateTime? endedAt,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    final List<CallParticipant> participants,
  }) = _$VideoCallImpl;
  const _VideoCall._() : super._();

  factory _VideoCall.fromJson(Map<String, dynamic> json) =
      _$VideoCallImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'host_id')
  String get hostId;
  @override
  UserProfile? get host;
  @override
  @JsonKey(name: 'channel_name')
  String? get channelName;
  @override
  @JsonKey(name: 'scheduled_at')
  DateTime? get scheduledAt;
  @override
  CallStatus get status;
  @override
  @JsonKey(name: 'started_at')
  DateTime? get startedAt;
  @override
  @JsonKey(name: 'ended_at')
  DateTime? get endedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt; // Joined data
  @override
  List<CallParticipant> get participants;

  /// Create a copy of VideoCall
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoCallImplCopyWith<_$VideoCallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallParticipant _$CallParticipantFromJson(Map<String, dynamic> json) {
  return _CallParticipant.fromJson(json);
}

/// @nodoc
mixin _$CallParticipant {
  @JsonKey(name: 'call_id')
  String get callId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at')
  DateTime? get joinedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'left_at')
  DateTime? get leftAt => throw _privateConstructorUsedError;
  UserProfile? get profile => throw _privateConstructorUsedError;

  /// Serializes this CallParticipant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallParticipantCopyWith<CallParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallParticipantCopyWith<$Res> {
  factory $CallParticipantCopyWith(
    CallParticipant value,
    $Res Function(CallParticipant) then,
  ) = _$CallParticipantCopyWithImpl<$Res, CallParticipant>;
  @useResult
  $Res call({
    @JsonKey(name: 'call_id') String callId,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'joined_at') DateTime? joinedAt,
    @JsonKey(name: 'left_at') DateTime? leftAt,
    UserProfile? profile,
  });

  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$CallParticipantCopyWithImpl<$Res, $Val extends CallParticipant>
    implements $CallParticipantCopyWith<$Res> {
  _$CallParticipantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? userId = null,
    Object? joinedAt = freezed,
    Object? leftAt = freezed,
    Object? profile = freezed,
  }) {
    return _then(
      _value.copyWith(
            callId: null == callId
                ? _value.callId
                : callId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            joinedAt: freezed == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            leftAt: freezed == leftAt
                ? _value.leftAt
                : leftAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            profile: freezed == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as UserProfile?,
          )
          as $Val,
    );
  }

  /// Create a copy of CallParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CallParticipantImplCopyWith<$Res>
    implements $CallParticipantCopyWith<$Res> {
  factory _$$CallParticipantImplCopyWith(
    _$CallParticipantImpl value,
    $Res Function(_$CallParticipantImpl) then,
  ) = __$$CallParticipantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'call_id') String callId,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'joined_at') DateTime? joinedAt,
    @JsonKey(name: 'left_at') DateTime? leftAt,
    UserProfile? profile,
  });

  @override
  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$CallParticipantImplCopyWithImpl<$Res>
    extends _$CallParticipantCopyWithImpl<$Res, _$CallParticipantImpl>
    implements _$$CallParticipantImplCopyWith<$Res> {
  __$$CallParticipantImplCopyWithImpl(
    _$CallParticipantImpl _value,
    $Res Function(_$CallParticipantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callId = null,
    Object? userId = null,
    Object? joinedAt = freezed,
    Object? leftAt = freezed,
    Object? profile = freezed,
  }) {
    return _then(
      _$CallParticipantImpl(
        callId: null == callId
            ? _value.callId
            : callId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        joinedAt: freezed == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leftAt: freezed == leftAt
            ? _value.leftAt
            : leftAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        profile: freezed == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallParticipantImpl implements _CallParticipant {
  const _$CallParticipantImpl({
    @JsonKey(name: 'call_id') required this.callId,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'joined_at') this.joinedAt,
    @JsonKey(name: 'left_at') this.leftAt,
    this.profile,
  });

  factory _$CallParticipantImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallParticipantImplFromJson(json);

  @override
  @JsonKey(name: 'call_id')
  final String callId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'joined_at')
  final DateTime? joinedAt;
  @override
  @JsonKey(name: 'left_at')
  final DateTime? leftAt;
  @override
  final UserProfile? profile;

  @override
  String toString() {
    return 'CallParticipant(callId: $callId, userId: $userId, joinedAt: $joinedAt, leftAt: $leftAt, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallParticipantImpl &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, callId, userId, joinedAt, leftAt, profile);

  /// Create a copy of CallParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallParticipantImplCopyWith<_$CallParticipantImpl> get copyWith =>
      __$$CallParticipantImplCopyWithImpl<_$CallParticipantImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CallParticipantImplToJson(this);
  }
}

abstract class _CallParticipant implements CallParticipant {
  const factory _CallParticipant({
    @JsonKey(name: 'call_id') required final String callId,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'joined_at') final DateTime? joinedAt,
    @JsonKey(name: 'left_at') final DateTime? leftAt,
    final UserProfile? profile,
  }) = _$CallParticipantImpl;

  factory _CallParticipant.fromJson(Map<String, dynamic> json) =
      _$CallParticipantImpl.fromJson;

  @override
  @JsonKey(name: 'call_id')
  String get callId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'joined_at')
  DateTime? get joinedAt;
  @override
  @JsonKey(name: 'left_at')
  DateTime? get leftAt;
  @override
  UserProfile? get profile;

  /// Create a copy of CallParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallParticipantImplCopyWith<_$CallParticipantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
