import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mission.dart';

class MissionNotifier extends StateNotifier<List<Mission>> {
  MissionNotifier() : super([]);

  Future<void> fetchMissions() async {
    // TODO: fetch from backend
    state = [
      Mission(
        id: "m1",
        name: "Hawassa Outreach",
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        location: "Hawassa",
        budget: 5000,
      ),
    ];
  }

  void addMission(Mission mission) {
    state = [...state, mission];
  }
}

final missionProvider =
    StateNotifierProvider<MissionNotifier, List<Mission>>((ref) {
  return MissionNotifier();
});