import '../api_client.dart';
import '../../models/outreach_data.dart';
import '../../models/outreach_number.dart';

class OutreachApi {
  final ApiClient _apiClient;

  OutreachApi(this._apiClient);

  Future<List<OutreachData>> getOutreachData(String missionId) async {
    try {
      final response = await _apiClient.dio.get(
        '/outreach-data',
        queryParameters: {'mission_id': missionId},
      );

      return (response.data as List)
          .map((json) => OutreachData.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch outreach data: $e');
    }
  }

  Future<OutreachData> createOutreachData(OutreachData data) async {
    try {
      final response = await _apiClient.dio.post(
        '/outreach-data',
        data: data.toJson(),
      );
      return OutreachData.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create outreach data: $e');
    }
  }

  Future<List<OutreachNumber>> getOutreachNumbers(String missionId) async {
    try {
      final response = await _apiClient.dio.get(
        '/outreach-numbers',
        queryParameters: {'mission_id': missionId},
      );

      return (response.data as List)
          .map((json) => OutreachNumber.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch outreach numbers: $e');
    }
  }
}

