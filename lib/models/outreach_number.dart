import 'package:freezed_annotation/freezed_annotation.dart';

part 'outreach_number.freezed.dart';
part 'outreach_number.g.dart';

@freezed
class OutreachNumber with _$OutreachNumber {
  const factory OutreachNumber({
    required String id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'mission_id') required String missionId,
    required int interested,
    @JsonKey(name: 'heared') required int heared, // Note: backend uses 'heared' (typo)
    required int saved,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _OutreachNumber;

  factory OutreachNumber.fromJson(Map<String, dynamic> json) =>
      _$OutreachNumberFromJson(json);
}

