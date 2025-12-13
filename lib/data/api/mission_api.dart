import '../api_client.dart';
import '../../models/mission.dart';

class MissionApi {
  final ApiClient _apiClient;

  MissionApi(this._apiClient);

  Future<List<Mission>> getMissions(
    String accountId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'account_id': accountId,
      };

      if (startDate != null) {
        queryParams['start_date'] = startDate.toIso8601String();
      }
      if (endDate != null) {
        queryParams['end_date'] = endDate.toIso8601String();
      }

      final response = await _apiClient.dio.get(
        '/missions',
        queryParameters: queryParams,
      );

      return (response.data as List)
          .map((json) => Mission.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch missions: $e');
    }
  }

  Future<Mission> createMission(Mission mission) async {
    try {
      final response = await _apiClient.dio.post(
        '/missions',
        data: mission.toJson(),
      );
      return Mission.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create mission: $e');
    }
  }

  Future<Mission> updateMission(Mission mission) async {
    try {
      final response = await _apiClient.dio.put(
        '/missions/${mission.id}',
        data: mission.toJson(),
      );
      return Mission.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update mission: $e');
    }
  }

  Future<void> deleteMission(String missionId) async {
    try {
      await _apiClient.dio.delete('/missions/$missionId');
    } catch (e) {
      throw Exception('Failed to delete mission: $e');
    }
  }

  Future<Mission> getMissionById(String missionId) async {
    try {
      final response = await _apiClient.dio.get('/missions/$missionId');
      return Mission.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch mission: $e');
    }
  }
}

