import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../core/constants/app_colors.dart';
import '../../models/mission.dart';
import '../../providers/mission_provider.dart';
import '../../providers/filter_provider.dart';
import '../widgets/filter_bar.dart';
import '../widgets/map_marker.dart';
import '../widgets/mission_detail_card.dart';
import '../widgets/account_switcher.dart';
import 'admin_add_mission_screen.dart';

import '../../models/account.dart';

class AdminHomeScreen extends ConsumerWidget {
  final Account? account;
  const AdminHomeScreen({Key? key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missions = ref.watch(missionNotifierProvider);
    final filters = ref.watch(filterNotifierProvider);

    return Scaffold(
      body: Stack(
        children: [
          // Map View
          FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(37.7749, -122.4194),
              initialZoom: 5.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.evangelism_app',
              ),
              MarkerLayer(
                markers: missions.when(
                  data: (missionList) => missionList
                      .where((mission) => 
                          mission.location != null &&
                          mission.location!['latitude'] != null &&
                          mission.location!['longitude'] != null)
                      .map((mission) {
                    return Marker(
                      point: LatLng(
                        (mission.location!['latitude'] as num).toDouble(),
                        (mission.location!['longitude'] as num).toDouble(),
                      ),
                      width: 40,
                      height: 40,
                      child: MapMarkerWidget(
                        mission: mission,
                        filterType: filters.filterType,
                        onTap: () => _showMissionDetails(context, ref, mission),
                      ),
                    );
                  }).toList(),
                  loading: () => <Marker>[], // Keep empty markers but handled below
                  error: (_, __) => <Marker>[],
                ),
              ),
            ],
          ),
          
          // Loading Indicator
          if (missions.isLoading)
             const Center(
               child: Card(
                 child: Padding(
                   padding: EdgeInsets.all(16.0),
                   child: CircularProgressIndicator(),
                 ),
               ),
             ),

          // Top Filter Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: FilterBar(
              filterType: filters.filterType,
              dateRange: filters.dateRange,
              onFilterTypeChanged: (type) {
                ref.read(filterNotifierProvider.notifier).setFilterType(type);
              },
              onDateRangeChanged: (range) {
                ref.read(filterNotifierProvider.notifier).setDateRange(range);
              },
              accentColor: AppColors.adminPrimary,
            ),
          ),

          // Floating Action Button
          Positioned(
            bottom: 80,
            right: 16,
            child: FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminAddMissionScreen(),
                ),
              ),
              backgroundColor: AppColors.adminPrimary,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showMissionDetails(BuildContext context, WidgetRef ref, Mission mission) {
    showModalBottomSheet(
      context: context,
      builder: (context) => MissionDetailCard(mission: mission),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}

