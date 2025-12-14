import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/api/api_client.dart';
import '../data/api/mission_api.dart';
import '../data/repositories/mission_repository.dart';
import '../models/mission.dart';
import '../models/user.dart';
import 'auth_provider.dart';
import 'account_provider.dart';

part 'mission_provider.g.dart';

@riverpod
MissionApi missionApi(MissionApiRef ref) {
  return MissionApi(ref.watch(apiClientProvider));
}

@riverpod
MissionRepository missionRepository(MissionRepositoryRef ref) {
  return MissionRepository(ref.watch(missionApiProvider));
}

// MissionRepository and MissionApi providers setup


@riverpod
class MissionNotifier extends _$MissionNotifier {
  @override
  Future<List<Mission>> build() async {
    final accountIdAsync = ref.watch(currentAccountIdProvider);
    final accountId = await accountIdAsync.valueOrNull;
    if (accountId == null) return [];
    return ref.read(missionRepositoryProvider).getMissions(accountId);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final accountIdAsync = ref.read(currentAccountIdProvider);
    final accountId = await accountIdAsync.valueOrNull;
    if (accountId == null) {
      state = const AsyncValue.data([]);
      return;
    }
    try {
      final missions =
          await ref.read(missionRepositoryProvider).getMissions(accountId);
      state = AsyncValue.data(missions);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> addMission(Map<String, dynamic> missionData) async {
    try {
      await ref.read(missionRepositoryProvider).createMission(missionData);
      await refresh();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> updateMission(String missionId, Map<String, dynamic> missionData) async {
    try {
      await ref.read(missionRepositoryProvider).updateMission(missionId, missionData);
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

  Future<void> inviteMissionary(String name, String email) async {
    try {
      final accountIdAsync = ref.read(currentAccountIdProvider);
      final accountId = await accountIdAsync.valueOrNull;
      
      if (accountId == null) {
        throw Exception('No account selected');
      }

      await ref.read(missionRepositoryProvider).inviteMissionary(accountId, name, email);
      // In a real app, you might refresh the missionary list here
      ref.invalidate(missionariesProvider);
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
  // Backend doesn't have assignedMissionaryId field, return first mission for now
  // In production, you'd filter by mission_user relationship
  return missions.isNotEmpty ? missions.first : null;
}

@riverpod
Future<List<User>> missionaries(MissionariesRef ref) async {
  // This would typically come from a user API filtered by role
  // For now, return empty list - will be implemented with user API
  // In production, this would fetch users with role='missionary' from the backend
  try {
    // Mock data for demonstration
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const User(
        id: '1',
        email: 'john.doe@example.com',
        fullName: 'John Doe',
        isActive: true,
        createdAt: '2023-01-01',
        role: 'missionary',
      ),
      const User(
        id: '2',
        email: 'jane.smith@example.com',
        fullName: 'Jane Smith',
        isActive: true,
        createdAt: '2023-01-02',
        role: 'missionary',
      ),
    ];
  } catch (e) {
    return [];
  }
}
