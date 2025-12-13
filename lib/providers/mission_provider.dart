import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/api/api_client.dart';
import '../data/api/mission_api.dart';
import '../data/repositories/mission_repository.dart';
import '../models/mission.dart';
import '../models/user.dart';
import 'auth_provider.dart';

part 'mission_provider.g.dart';

@riverpod
MissionApi missionApi(MissionApiRef ref) {
  return MissionApi(ref.watch(apiClientProvider));
}

@riverpod
MissionRepository missionRepository(MissionRepositoryRef ref) {
  return MissionRepository(ref.watch(missionApiProvider));
}

@riverpod
class MissionNotifier extends _$MissionNotifier {
  @override
  Future<List<Mission>> build() async {
    final accountId = ref.watch(currentAccountIdProvider);
    return ref.read(missionRepositoryProvider).getMissions(accountId);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final accountId = ref.read(currentAccountIdProvider);
    try {
      final missions =
          await ref.read(missionRepositoryProvider).getMissions(accountId);
      state = AsyncValue.data(missions);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> addMission(Mission mission) async {
    try {
      await ref.read(missionRepositoryProvider).createMission(mission);
      await refresh();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> updateMission(Mission mission) async {
    try {
      await ref.read(missionRepositoryProvider).updateMission(mission);
      await refresh();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> deleteMission(String missionId) async {
    try {
      await ref.read(missionRepositoryProvider).deleteMission(missionId);
      await refresh();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}

@riverpod
Future<Mission?> userMission(UserMissionRef ref) async {
  final authState = ref.watch(authNotifierProvider);
  final user = await authState.valueOrNull;
  if (user == null) return null;

  final missions = await ref.watch(missionNotifierProvider.future);
  try {
    return missions.firstWhere(
      (mission) => mission.assignedMissionaryId == user.id,
    );
  } catch (e) {
    // Return first mission if no specific assignment or empty list
    return missions.isNotEmpty ? missions.first : null;
  }
}

@riverpod
Future<List<User>> missionaries(MissionariesRef ref) async {
  // This would typically come from a user API filtered by role
  // For now, return empty list - will be implemented with user API
  // In production, this would fetch users with role='missionary' from the backend
  try {
    // TODO: Implement user API to fetch missionaries
    // final response = await ref.read(userApiProvider).getUsers(accountId, role: 'missionary');
    return [];
  } catch (e) {
    return [];
  }
}
