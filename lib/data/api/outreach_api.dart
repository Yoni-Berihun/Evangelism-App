import '../api_client.dart';
import '../../models/outreach_data.dart';
import '../../models/outreach_number.dart';
import '../../core/constants/api_constants.dart';

class OutreachApi {
  final ApiClient _apiClient;

  OutreachApi(this._apiClient);

  Future<List<OutreachData>> getOutreachData({
    String? missionId,
    int skip = 0,
    int limit = 100,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'skip': skip,
        'limit': limit,
      };
      
      if (missionId != null) {
        queryParams['mission_id'] = missionId;
      }

      final response = await _apiClient.dio.get(
        ApiConstants.outreachData,
        queryParameters: queryParams,
      );

      return (response.data as List)
          .map((json) => OutreachData.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch outreach data: ${e.toString()}');
    }
  }

  Future<OutreachData> createOutreachData(Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.dio.post(
        ApiConstants.outreachData,
        data: data,
      );
      return OutreachData.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to create outreach data: ${e.toString()}');
    }
  }

  Future<OutreachNumber?> getOutreachNumbers(String missionId) async {
    try {
      final response = await _apiClient.dio.get(
        ApiConstants.outreachNumbers,
        queryParameters: {'mission_id': missionId},
      );

      if (response.data == null) {
        return null;
      }

      return OutreachNumber.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch outreach numbers: ${e.toString()}');
    }
  }

  Future<OutreachNumber> createOrUpdateOutreachNumbers(Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.dio.post(
        ApiConstants.outreachNumbers,
        data: data,
      );
      return OutreachNumber.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to create/update outreach numbers: ${e.toString()}');
    }
  }
}

