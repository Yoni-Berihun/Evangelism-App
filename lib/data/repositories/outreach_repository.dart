import '../api/outreach_api.dart';
import '../../models/outreach_data.dart';
import '../../models/outreach_number.dart';

class OutreachRepository {
  final OutreachApi _outreachApi;

  OutreachRepository(this._outreachApi);

  Future<List<OutreachData>> getOutreachData(String missionId) async {
    return await _outreachApi.getOutreachData(missionId);
  }

  Future<OutreachData> createOutreachData(OutreachData data) async {
    return await _outreachApi.createOutreachData(data);
  }

  Future<List<OutreachNumber>> getOutreachNumbers(String missionId) async {
    return await _outreachApi.getOutreachNumbers(missionId);
  }
}

