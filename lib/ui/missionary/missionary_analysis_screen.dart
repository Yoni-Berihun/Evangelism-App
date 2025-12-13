import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/mission_provider.dart';
import '../../providers/outreach_provider.dart';
import '../../providers/expense_provider.dart';
import '../widgets/stat_card.dart';

class MissionaryAnalysisScreen extends ConsumerWidget {
  const MissionaryAnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mission = ref.watch(userMissionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis'),
        backgroundColor: AppColors.missionaryPrimary,
      ),
      body: mission.when(
        data: (userMission) {
          if (userMission == null) {
            return const Center(
              child: Text('No mission assigned'),
            );
          }

          final outreachData = ref.watch(outreachDataProvider(userMission.id));
          final expenses = ref.watch(expensesProvider(userMission.id));

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Stats Overview
              Row(
                children: [
                  Expanded(
                    child: outreachData.when(
                      data: (data) => StatCard(
                        value: data
                            .fold<int>(0, (sum, d) => sum + d.soulsSaved)
                            .toString(),
                        label: 'Total Souls',
                        color: AppColors.missionaryPrimary,
                      ),
                      loading: () => const StatCard(
                        value: '0',
                        label: 'Total Souls',
                        color: AppColors.missionaryPrimary,
                      ),
                      error: (_, __) => const StatCard(
                        value: '0',
                        label: 'Total Souls',
                        color: AppColors.missionaryPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: outreachData.when(
                      data: (data) => StatCard(
                        value: data
                            .fold<int>(0, (sum, d) => sum + d.baptisms)
                            .toString(),
                        label: 'Total Baptisms',
                        color: AppColors.green,
                      ),
                      loading: () => const StatCard(
                        value: '0',
                        label: 'Total Baptisms',
                        color: AppColors.green,
                      ),
                      error: (_, __) => const StatCard(
                        value: '0',
                        label: 'Total Baptisms',
                        color: AppColors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Chart Section
              Container(
                height: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: outreachData.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const Center(child: Text('No data available'));
                    }
                    return LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: data.asMap().entries.map((entry) {
                              return FlSpot(
                                entry.key.toDouble(),
                                entry.value.soulsSaved.toDouble(),
                              );
                            }).toList(),
                            isCurved: true,
                            color: AppColors.missionaryPrimary,
                            barWidth: 3,
                            dotData: FlDotData(show: true),
                          ),
                        ],
                      ),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (_, __) => const Center(child: Text('Error loading data')),
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

