import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/mission_provider.dart';
import '../../providers/outreach_provider.dart';
import '../../providers/expense_provider.dart';
import '../widgets/stat_card.dart';

class MissionaryHomeScreen extends ConsumerWidget {
  const MissionaryHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mission = ref.watch(userMissionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Mission'),
        backgroundColor: AppColors.missionaryPrimary,
      ),
      body: mission.when(
        data: (userMission) {
          if (userMission == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment_late, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No Mission Assigned',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Please contact your administrator.',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Mission Info Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.missionaryLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userMission.missionName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Text(userMission.location),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Stats Section
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      value: ref
                          .watch(outreachDataProvider(userMission.id))
                          .when(
                            data: (data) => data.fold<int>(
                                    0, (sum, d) => sum + d.soulsSaved)
                                .toString(),
                            loading: () => '0',
                            error: (_, __) => '0',
                          ),
                      label: 'Souls Saved',
                      color: AppColors.missionaryPrimary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      value: ref
                          .watch(outreachDataProvider(userMission.id))
                          .when(
                            data: (data) => data.fold<int>(
                                    0, (sum, d) => sum + d.baptisms)
                                .toString(),
                            loading: () => '0',
                            error: (_, __) => '0',
                          ),
                      label: 'Baptisms',
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      value: '\$${ref.watch(expensesProvider(userMission.id)).when(
                            data: (expenses) => expenses
                                .fold<double>(
                                    0.0, (sum, e) => sum + e.amount)
                                .toStringAsFixed(0),
                            loading: () => '0',
                            error: (_, __) => '0',
                          })}',
                      label: 'Expenses',
                      color: AppColors.orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      value: ref
                          .watch(outreachDataProvider(userMission.id))
                          .when(
                            data: (data) => data.length.toString(),
                            loading: () => '0',
                            error: (_, __) => '0',
                          ),
                      label: 'Logs',
                      color: AppColors.gold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Map View
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                          userMission.latitude, userMission.longitude),
                      zoom: 10.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: const ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.evangelism_app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                                userMission.latitude, userMission.longitude),
                            width: 40,
                            height: 40,
                            builder: (context) => Container(
                              decoration: BoxDecoration(
                                color: AppColors.missionaryPrimary,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

