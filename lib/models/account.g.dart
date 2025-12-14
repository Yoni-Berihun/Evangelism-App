// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['id'] as String,
      accountName: json['account_name'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      location: json['location'] as String?,
      createdBy: json['created_by'] as String,
      isActive: json['is_active'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_name': instance.accountName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'location': instance.location,
      'created_by': instance.createdBy,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
