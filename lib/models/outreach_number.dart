import 'package:freezed_annotation/freezed_annotation.dart';

part 'outreach_number.freezed.dart';
part 'outreach_number.g.dart';

@freezed
class OutreachNumber with _$OutreachNumber {
  const factory OutreachNumber({
    required String id,
    required String missionId,
    required int soulsSaved,
    required int baptisms,
    required DateTime date,
  }) = _OutreachNumber;

  factory OutreachNumber.fromJson(Map<String, dynamic> json) =>
      _$OutreachNumberFromJson(json);
}

