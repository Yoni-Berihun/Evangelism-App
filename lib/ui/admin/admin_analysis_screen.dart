import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/mission_provider.dart';
import '../../providers/outreach_provider.dart';
import '../../providers/expense_provider.dart';
import '../widgets/stat_card.dart';

class AdminAnalysisScreen extends ConsumerWidget {
  const AdminAnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final missions = ref.watch(missionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis'),
        backgroundColor: AppColors.adminPrimary,
      ),
      body: missions.when(
        data: (missionList) {
          if (missionList.isEmpty) {
            return const Center(
              child: Text('No missions available'),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Overall Stats
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      value: missionList.length.toString(),
                      label: 'Total Missions',
                      color: AppColors.adminPrimary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      value: '\$${_calculateTotalBudget(missionList).toStringAsFixed(0)}',
                      label: 'Total Budget',
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Charts Section
              _buildChartSection(context, ref, missionList),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }

  double _calculateTotalBudget(List missions) {
    return missions.fold(0.0, (sum, mission) => sum + mission.budget);
  }

  Widget _buildChartSection(
      BuildContext context, WidgetRef ref, List missions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mission Overview',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
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
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return const Text('');
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              barGroups: missions.asMap().entries.map((entry) {
                final index = entry.key;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: 50,
                      color: AppColors.adminPrimary,
                      width: 16,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(4),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

