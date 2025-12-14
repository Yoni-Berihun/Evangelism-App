// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outreach_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutreachDataImpl _$$OutreachDataImplFromJson(Map<String, dynamic> json) =>
    _$OutreachDataImpl(
      id: json['id'] as String,
      accountId: json['account_id'] as String,
      missionId: json['mission_id'] as String,
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String?,
      status: json['status'] as String?,
      createdByUserId: json['created_by_user_id'] as String,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$OutreachDataImplToJson(_$OutreachDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'mission_id': instance.missionId,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'status': instance.status,
      'created_by_user_id': instance.createdByUserId,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
