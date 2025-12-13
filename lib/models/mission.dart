import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission.freezed.dart';
part 'mission.g.dart';

@freezed
class Mission with _$Mission {
  const factory Mission({
    required String id,
    required String accountId,
    required String missionName,
    required String location,
    required double latitude,
    required double longitude,
    required String teamName,
    required DateTime startDate,
    required DateTime endDate,
    required double budget,
    String? assignedMissionaryId,
    String? assignedMissionaryName,
    required DateTime createdAt,
  }) = _Mission;

  factory Mission.fromJson(Map<String, dynamic> json) =>
      _$MissionFromJson(json);
}
