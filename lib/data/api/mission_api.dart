import 'api_client.dart';
import '../../models/mission.dart';
import '../../core/constants/api_constants.dart';

class MissionApi {
  final ApiClient _apiClient;

  MissionApi(this._apiClient);

  Future<List<Mission>> getMissions(
    String accountId, {
    int skip = 0,
    int limit = 100,
  }) async {
    try {
      final response = await _apiClient.dio.get(
        ApiConstants.missions,
        queryParameters: {
          'account_id': accountId,
          'skip': skip,
          'limit': limit,
        },
      );

      return (response.data as List)
          .map((json) => Mission.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch missions: ${e.toString()}');
    }
  }

  Future<Mission> createMission(Map<String, dynamic> missionData) async {
    try {
      final response = await _apiClient.dio.post(
        ApiConstants.missions,
        data: missionData,
      );
      return Mission.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to create mission: ${e.toString()}');
    }
  }

  Future<Mission> updateMission(String missionId, Map<String, dynamic> missionData) async {
    try {
      final response = await _apiClient.dio.put(
        '${ApiConstants.missions}/$missionId',
        data: missionData,
      );
      return Mission.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to update mission: ${e.toString()}');
    }
  }

  Future<void> deleteMission(String missionId) async {
    try {
      await _apiClient.dio.delete('${ApiConstants.missions}/$missionId');
    } catch (e) {
      throw Exception('Failed to delete mission: ${e.toString()}');
    }
  }

  Future<Mission> getMissionById(String missionId) async {
    try {
      final response = await _apiClient.dio.get('${ApiConstants.missions}/$missionId');
      return Mission.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch mission: ${e.toString()}');
    }
  }
}

