import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/api/api_client.dart';
import '../data/api/outreach_api.dart';
import '../data/repositories/outreach_repository.dart';
import '../models/outreach_data.dart';
import '../models/outreach_number.dart';
import 'auth_provider.dart';

part 'outreach_provider.g.dart';

@riverpod
OutreachApi outreachApi(OutreachApiRef ref) {
  return OutreachApi(ref.watch(apiClientProvider));
}

@riverpod
OutreachRepository outreachRepository(OutreachRepositoryRef ref) {
  return OutreachRepository(ref.watch(outreachApiProvider));
}

@riverpod
Future<List<OutreachData>> outreachData(
    OutreachDataRef ref, {String? missionId}) async {
  return ref.read(outreachRepositoryProvider).getOutreachData(missionId: missionId);
}

@riverpod
Future<OutreachNumber?> outreachNumbers(
    OutreachNumbersRef ref, String missionId) async {
  return ref.read(outreachRepositoryProvider).getOutreachNumbers(missionId);
}

@riverpod
class OutreachNotifier extends _$OutreachNotifier {
  String? _missionId;

  @override
  Future<List<OutreachData>> build(String? missionId) async {
    _missionId = missionId;
    return ref.read(outreachRepositoryProvider).getOutreachData(missionId: missionId);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data =
          await ref.read(outreachRepositoryProvider).getOutreachData(missionId: _missionId);
      state = AsyncValue.data(data);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> addOutreachData(Map<String, dynamic> data) async {
    try {
      await ref.read(outreachRepositoryProvider).createOutreachData(data);
      state = const AsyncValue.loading();
      final updatedData =
          await ref.read(outreachRepositoryProvider).getOutreachData(missionId: _missionId);
      state = AsyncValue.data(updatedData);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}

@riverpod
Future<Map<String, dynamic>> missionStats(
    MissionStatsRef ref, String missionId) async {
  final outreachData = await ref.watch(outreachDataProvider(missionId: missionId).future);
  final outreachNumbers = await ref.watch(outreachNumbersProvider(missionId).future);

  // Calculate stats from outreach numbers if available
  int totalSaved = 0;
  int totalInterested = 0;
  int totalHeared = 0;
  
  if (outreachNumbers != null) {
    totalSaved = outreachNumbers.saved;
    totalInterested = outreachNumbers.interested;
    totalHeared = outreachNumbers.heared;
  }

  return {
    'totalSaved': totalSaved,
    'totalInterested': totalInterested,
    'totalHeared': totalHeared,
    'contactsCount': outreachData.length,
  };
}

