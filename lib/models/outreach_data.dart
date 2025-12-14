import 'package:freezed_annotation/freezed_annotation.dart';

part 'outreach_data.freezed.dart';
part 'outreach_data.g.dart';

@freezed
class OutreachData with _$OutreachData {
  const factory OutreachData({
    required String id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'mission_id') required String missionId,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? status, // e.g., 'interested', 'saved'
    @JsonKey(name: 'created_by_user_id') required String createdByUserId,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _OutreachData;

  factory OutreachData.fromJson(Map<String, dynamic> json) =>
      _$OutreachDataFromJson(json);
}

