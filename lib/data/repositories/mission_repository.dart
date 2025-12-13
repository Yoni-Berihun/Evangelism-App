import '../api/mission_api.dart';
import '../../models/mission.dart';

class MissionRepository {
  final MissionApi _missionApi;

  MissionRepository(this._missionApi);

  Future<List<Mission>> getMissions(
    String accountId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    return await _missionApi.getMissions(
      accountId,
      startDate: startDate,
      endDate: endDate,
    );
  }

  Future<Mission> createMission(Mission mission) async {
    return await _missionApi.createMission(mission);
  }

  Future<Mission> updateMission(Mission mission) async {
    return await _missionApi.updateMission(mission);
  }

  Future<void> deleteMission(String missionId) async {
    await _missionApi.deleteMission(missionId);
  }

  Future<Mission> getMissionById(String missionId) async {
    return await _missionApi.getMissionById(missionId);
  }
}

