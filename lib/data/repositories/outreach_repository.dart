import '../api/outreach_api.dart';
import '../../models/outreach_data.dart';
import '../../models/outreach_number.dart';

class OutreachRepository {
  final OutreachApi _outreachApi;

  OutreachRepository(this._outreachApi);

  Future<List<OutreachData>> getOutreachData({
    String? missionId,
    int skip = 0,
    int limit = 100,
  }) async {
    return await _outreachApi.getOutreachData(
      missionId: missionId,
      skip: skip,
      limit: limit,
    );
  }

  Future<OutreachData> createOutreachData(Map<String, dynamic> data) async {
    return await _outreachApi.createOutreachData(data);
  }

  Future<OutreachNumber?> getOutreachNumbers(String missionId) async {
    return await _outreachApi.getOutreachNumbers(missionId);
  }

  Future<OutreachNumber> createOrUpdateOutreachNumbers(Map<String, dynamic> data) async {
    return await _outreachApi.createOrUpdateOutreachNumbers(data);
  }
}

