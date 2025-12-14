// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outreach_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OutreachNumber _$OutreachNumberFromJson(Map<String, dynamic> json) {
  return _OutreachNumber.fromJson(json);
}

/// @nodoc
mixin _$OutreachNumber {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mission_id')
  String get missionId => throw _privateConstructorUsedError;
  int get interested => throw _privateConstructorUsedError;
  @JsonKey(name: 'heared')
  int get heared => throw _privateConstructorUsedError; // Note: backend uses 'heared' (typo)
  int get saved => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OutreachNumber to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutreachNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutreachNumberCopyWith<OutreachNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutreachNumberCopyWith<$Res> {
  factory $OutreachNumberCopyWith(
    OutreachNumber value,
    $Res Function(OutreachNumber) then,
  ) = _$OutreachNumberCopyWithImpl<$Res, OutreachNumber>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'account_id') String accountId,
    @JsonKey(name: 'mission_id') String missionId,
    int interested,
    @JsonKey(name: 'heared') int heared,
    int saved,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class _$OutreachNumberCopyWithImpl<$Res, $Val extends OutreachNumber>
    implements $OutreachNumberCopyWith<$Res> {
  _$OutreachNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutreachNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? missionId = null,
    Object? interested = null,
    Object? heared = null,
    Object? saved = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            accountId: null == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as String,
            missionId: null == missionId
                ? _value.missionId
                : missionId // ignore: cast_nullable_to_non_nullable
                      as String,
            interested: null == interested
                ? _value.interested
                : interested // ignore: cast_nullable_to_non_nullable
                      as int,
            heared: null == heared
                ? _value.heared
                : heared // ignore: cast_nullable_to_non_nullable
                      as int,
            saved: null == saved
                ? _value.saved
                : saved // ignore: cast_nullable_to_non_nullable
                      as int,
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OutreachNumberImplCopyWith<$Res>
    implements $OutreachNumberCopyWith<$Res> {
  factory _$$OutreachNumberImplCopyWith(
    _$OutreachNumberImpl value,
    $Res Function(_$OutreachNumberImpl) then,
  ) = __$$OutreachNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'account_id') String accountId,
    @JsonKey(name: 'mission_id') String missionId,
    int interested,
    @JsonKey(name: 'heared') int heared,
    int saved,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class __$$OutreachNumberImplCopyWithImpl<$Res>
    extends _$OutreachNumberCopyWithImpl<$Res, _$OutreachNumberImpl>
    implements _$$OutreachNumberImplCopyWith<$Res> {
  __$$OutreachNumberImplCopyWithImpl(
    _$OutreachNumberImpl _value,
    $Res Function(_$OutreachNumberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutreachNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? missionId = null,
    Object? interested = null,
    Object? heared = null,
    Object? saved = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$OutreachNumberImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as String,
        missionId: null == missionId
            ? _value.missionId
            : missionId // ignore: cast_nullable_to_non_nullable
                  as String,
        interested: null == interested
            ? _value.interested
            : interested // ignore: cast_nullable_to_non_nullable
                  as int,
        heared: null == heared
            ? _value.heared
            : heared // ignore: cast_nullable_to_non_nullable
                  as int,
        saved: null == saved
            ? _value.saved
            : saved // ignore: cast_nullable_to_non_nullable
                  as int,
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OutreachNumberImpl implements _OutreachNumber {
  const _$OutreachNumberImpl({
    required this.id,
    @JsonKey(name: 'account_id') required this.accountId,
    @JsonKey(name: 'mission_id') required this.missionId,
    required this.interested,
    @JsonKey(name: 'heared') required this.heared,
    required this.saved,
    @JsonKey(name: 'deleted_at') this.deletedAt,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$OutreachNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutreachNumberImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'account_id')
  final String accountId;
  @override
  @JsonKey(name: 'mission_id')
  final String missionId;
  @override
  final int interested;
  @override
  @JsonKey(name: 'heared')
  final int heared;
  // Note: backend uses 'heared' (typo)
  @override
  final int saved;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'OutreachNumber(id: $id, accountId: $accountId, missionId: $missionId, interested: $interested, heared: $heared, saved: $saved, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutreachNumberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.missionId, missionId) ||
                other.missionId == missionId) &&
            (identical(other.interested, interested) ||
                other.interested == interested) &&
            (identical(other.heared, heared) || other.heared == heared) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    accountId,
    missionId,
    interested,
    heared,
    saved,
    deletedAt,
    createdAt,
    updatedAt,
  );

  /// Create a copy of OutreachNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutreachNumberImplCopyWith<_$OutreachNumberImpl> get copyWith =>
      __$$OutreachNumberImplCopyWithImpl<_$OutreachNumberImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OutreachNumberImplToJson(this);
  }
}

abstract class _OutreachNumber implements OutreachNumber {
  const factory _OutreachNumber({
    required final String id,
    @JsonKey(name: 'account_id') required final String accountId,
    @JsonKey(name: 'mission_id') required final String missionId,
    required final int interested,
    @JsonKey(name: 'heared') required final int heared,
    required final int saved,
    @JsonKey(name: 'deleted_at') final String? deletedAt,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
  }) = _$OutreachNumberImpl;

  factory _OutreachNumber.fromJson(Map<String, dynamic> json) =
      _$OutreachNumberImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'account_id')
  String get accountId;
  @override
  @JsonKey(name: 'mission_id')
  String get missionId;
  @override
  int get interested;
  @override
  @JsonKey(name: 'heared')
  int get heared; // Note: backend uses 'heared' (typo)
  @override
  int get saved;
  @override
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of OutreachNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutreachNumberImplCopyWith<_$OutreachNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
