import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/mission_provider.dart';

class MissionListScreen extends ConsumerWidget {
  const MissionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missions = ref.watch(missionProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Missions")),
      body: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          final mission = missions[index];
          return ListTile(
            title: Text(mission.name),
            subtitle: Text("${mission.location} • Budget: ${mission.budget}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(missionProvider.notifier).fetchMissions();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}