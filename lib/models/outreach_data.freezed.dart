// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outreach_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OutreachData _$OutreachDataFromJson(Map<String, dynamic> json) {
  return _OutreachData.fromJson(json);
}

/// @nodoc
mixin _$OutreachData {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  String get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mission_id')
  String get missionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // e.g., 'interested', 'saved'
  @JsonKey(name: 'created_by_user_id')
  String get createdByUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OutreachData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutreachData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutreachDataCopyWith<OutreachData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutreachDataCopyWith<$Res> {
  factory $OutreachDataCopyWith(
    OutreachData value,
    $Res Function(OutreachData) then,
  ) = _$OutreachDataCopyWithImpl<$Res, OutreachData>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'account_id') String accountId,
    @JsonKey(name: 'mission_id') String missionId,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? status,
    @JsonKey(name: 'created_by_user_id') String createdByUserId,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class _$OutreachDataCopyWithImpl<$Res, $Val extends OutreachData>
    implements $OutreachDataCopyWith<$Res> {
  _$OutreachDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutreachData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? missionId = null,
    Object? fullName = null,
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? createdByUserId = null,
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
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdByUserId: null == createdByUserId
                ? _value.createdByUserId
                : createdByUserId // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$OutreachDataImplCopyWith<$Res>
    implements $OutreachDataCopyWith<$Res> {
  factory _$$OutreachDataImplCopyWith(
    _$OutreachDataImpl value,
    $Res Function(_$OutreachDataImpl) then,
  ) = __$$OutreachDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'account_id') String accountId,
    @JsonKey(name: 'mission_id') String missionId,
    @JsonKey(name: 'full_name') String fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? status,
    @JsonKey(name: 'created_by_user_id') String createdByUserId,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
  });
}

/// @nodoc
class __$$OutreachDataImplCopyWithImpl<$Res>
    extends _$OutreachDataCopyWithImpl<$Res, _$OutreachDataImpl>
    implements _$$OutreachDataImplCopyWith<$Res> {
  __$$OutreachDataImplCopyWithImpl(
    _$OutreachDataImpl _value,
    $Res Function(_$OutreachDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutreachData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountId = null,
    Object? missionId = null,
    Object? fullName = null,
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? createdByUserId = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$OutreachDataImpl(
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
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdByUserId: null == createdByUserId
            ? _value.createdByUserId
            : createdByUserId // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$OutreachDataImpl implements _OutreachData {
  const _$OutreachDataImpl({
    required this.id,
    @JsonKey(name: 'account_id') required this.accountId,
    @JsonKey(name: 'mission_id') required this.missionId,
    @JsonKey(name: 'full_name') required this.fullName,
    @JsonKey(name: 'phone_number') this.phoneNumber,
    this.status,
    @JsonKey(name: 'created_by_user_id') required this.createdByUserId,
    @JsonKey(name: 'deleted_at') this.deletedAt,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$OutreachDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutreachDataImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'account_id')
  final String accountId;
  @override
  @JsonKey(name: 'mission_id')
  final String missionId;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  final String? status;
  // e.g., 'interested', 'saved'
  @override
  @JsonKey(name: 'created_by_user_id')
  final String createdByUserId;
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
    return 'OutreachData(id: $id, accountId: $accountId, missionId: $missionId, fullName: $fullName, phoneNumber: $phoneNumber, status: $status, createdByUserId: $createdByUserId, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutreachDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.missionId, missionId) ||
                other.missionId == missionId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
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
    fullName,
    phoneNumber,
    status,
    createdByUserId,
    deletedAt,
    createdAt,
    updatedAt,
  );

  /// Create a copy of OutreachData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutreachDataImplCopyWith<_$OutreachDataImpl> get copyWith =>
      __$$OutreachDataImplCopyWithImpl<_$OutreachDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutreachDataImplToJson(this);
  }
}

abstract class _OutreachData implements OutreachData {
  const factory _OutreachData({
    required final String id,
    @JsonKey(name: 'account_id') required final String accountId,
    @JsonKey(name: 'mission_id') required final String missionId,
    @JsonKey(name: 'full_name') required final String fullName,
    @JsonKey(name: 'phone_number') final String? phoneNumber,
    final String? status,
    @JsonKey(name: 'created_by_user_id') required final String createdByUserId,
    @JsonKey(name: 'deleted_at') final String? deletedAt,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
  }) = _$OutreachDataImpl;

  factory _OutreachData.fromJson(Map<String, dynamic> json) =
      _$OutreachDataImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'account_id')
  String get accountId;
  @override
  @JsonKey(name: 'mission_id')
  String get missionId;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  String? get status; // e.g., 'interested', 'saved'
  @override
  @JsonKey(name: 'created_by_user_id')
  String get createdByUserId;
  @override
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of OutreachData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutreachDataImplCopyWith<_$OutreachDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
