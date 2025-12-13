import 'package:freezed_annotation/freezed_annotation.dart';

part 'outreach_data.freezed.dart';
part 'outreach_data.g.dart';

@freezed
class OutreachData with _$OutreachData {
  const factory OutreachData({
    required String id,
    required String accountId,
    required String missionId,
    required String userId,
    required String userName,
    required int soulsSaved,
    required int baptisms,
    String? testimonies,
    required DateTime date,
    required DateTime createdAt,
  }) = _OutreachData;

  factory OutreachData.fromJson(Map<String, dynamic> json) =>
      _$OutreachDataFromJson(json);
}

