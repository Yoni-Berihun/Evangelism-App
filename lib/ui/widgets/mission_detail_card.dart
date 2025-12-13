import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/date_utils.dart';
import '../../models/mission.dart';

class MissionDetailCard extends StatelessWidget {
  final Mission mission;

  const MissionDetailCard({
    Key? key,
    required this.mission,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  mission.missionName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow(Icons.location_on, mission.location),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.group, mission.teamName),
          const SizedBox(height: 8),
          _buildInfoRow(
            Icons.calendar_today,
            '${DateUtils.formatDate(mission.startDate)} - ${DateUtils.formatDate(mission.endDate)}',
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            Icons.attach_money,
            '\$${mission.budget.toStringAsFixed(2)}',
          ),
          if (mission.assignedMissionaryName != null) ...[
            const SizedBox(height: 8),
            _buildInfoRow(Icons.person, mission.assignedMissionaryName!),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

