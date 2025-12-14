import '../api/mission_api.dart';
import '../../models/mission.dart';

class MissionRepository {
  final MissionApi _missionApi;

  MissionRepository(this._missionApi);

  Future<List<Mission>> getMissions(
    String accountId, {
    int skip = 0,
    int limit = 100,
  }) async {
    return await _missionApi.getMissions(
      accountId,
      skip: skip,
      limit: limit,
    );
  }

  Future<Mission> createMission(Map<String, dynamic> missionData) async {
    return await _missionApi.createMission(missionData);
  }

  Future<Mission> updateMission(String missionId, Map<String, dynamic> missionData) async {
    return await _missionApi.updateMission(missionId, missionData);
  }

  Future<void> deleteMission(String missionId) async {
    await _missionApi.deleteMission(missionId);
  }

  Future<Mission> getMissionById(String missionId) async {
    return await _missionApi.getMissionById(missionId);
  }

  Future<void> inviteMissionary(String accountId, String name, String email) async {
    await _missionApi.inviteMissionary(accountId, name, email);
  }
}

