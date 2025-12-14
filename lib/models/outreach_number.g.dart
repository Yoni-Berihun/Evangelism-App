// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outreach_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutreachNumberImpl _$$OutreachNumberImplFromJson(Map<String, dynamic> json) =>
    _$OutreachNumberImpl(
      id: json['id'] as String,
      accountId: json['account_id'] as String,
      missionId: json['mission_id'] as String,
      interested: (json['interested'] as num).toInt(),
      heared: (json['heared'] as num).toInt(),
      saved: (json['saved'] as num).toInt(),
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$OutreachNumberImplToJson(
  _$OutreachNumberImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'account_id': instance.accountId,
  'mission_id': instance.missionId,
  'interested': instance.interested,
  'heared': instance.heared,
  'saved': instance.saved,
  'deleted_at': instance.deletedAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
