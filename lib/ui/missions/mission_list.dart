import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/mission_provider.dart';

class MissionListScreen extends ConsumerWidget {
  const MissionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missionsAsync = ref.watch(missionNotifierProvider);
    final missions = missionsAsync.valueOrNull ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text("Missions")),
      body: ListView.builder(
        itemCount: missions.length,
        itemBuilder: (context, index) {
          final mission = missions[index];
          return ListTile(
            title: Text(mission.name),
            subtitle: Text(
              "${mission.location?['address'] ?? 'No location'} • Budget: \$${mission.budget?.toStringAsFixed(2) ?? '0.00'}",
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(missionNotifierProvider.notifier).refresh();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}