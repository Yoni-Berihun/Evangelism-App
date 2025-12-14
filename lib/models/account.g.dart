// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['id'] as String,
      accountName: json['accountName'] as String,
      logoUrl: json['logoUrl'] as String?,
      subscriptionPlan: json['subscriptionPlan'] as String,
      subscriptionExpiresAt: DateTime.parse(
        json['subscriptionExpiresAt'] as String,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountName': instance.accountName,
      'logoUrl': instance.logoUrl,
      'subscriptionPlan': instance.subscriptionPlan,
      'subscriptionExpiresAt': instance.subscriptionExpiresAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
