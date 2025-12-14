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

          final outreachNumbers = ref.watch(outreachNumbersProvider(userMission.id));
          final expenses = ref.watch(expensesProvider(missionId: userMission.id));

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Stats Overview
              Row(
                children: [
                  Expanded(
                    child: ref.watch(outreachNumbersProvider(userMission.id)).when(
                      data: (numbers) => StatCard(
                        value: (numbers?.saved ?? 0).toString(),
                        label: 'Total Saved',
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
                    child: ref.watch(outreachNumbersProvider(userMission.id)).when(
                      data: (numbers) => StatCard(
                        value: (numbers?.interested ?? 0).toString(),
                        label: 'Total Interested',
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
                child: outreachNumbers.when(
                  data: (numbers) {
                    if (numbers == null) {
                      return const Center(child: Text('No data available'));
                    }
                    // Simple bar chart showing outreach numbers
                    return BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: (numbers.saved + numbers.interested + numbers.heared).toDouble() + 10,
                        barTouchData: BarTouchData(enabled: false),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return const Text('Saved');
                                  case 1:
                                    return const Text('Interested');
                                  case 2:
                                    return const Text('Heard');
                                  default:
                                    return const Text('');
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                          ),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                toY: numbers.saved.toDouble(),
                                color: AppColors.missionaryPrimary,
                                width: 20,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                toY: numbers.interested.toDouble(),
                                color: AppColors.green,
                                width: 20,
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: numbers.heared.toDouble(),
                                color: AppColors.orange,
                                width: 20,
                              ),
                            ],
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

