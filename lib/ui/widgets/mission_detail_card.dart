import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/date_utils.dart' as AppDateUtils;
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
                  mission.name,
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
          if (mission.location != null) ...[
            _buildInfoRow(
              Icons.location_on,
              _formatLocation(mission.location!),
            ),
            const SizedBox(height: 8),
          ],
          if (mission.startDate != null && mission.endDate != null) ...[
            _buildInfoRow(
              Icons.calendar_today,
              '${_formatDate(mission.startDate!)} - ${_formatDate(mission.endDate!)}',
            ),
            const SizedBox(height: 8),
          ],
          if (mission.budget != null) ...[
            _buildInfoRow(
              Icons.attach_money,
              '\$${mission.budget!.toStringAsFixed(2)}',
            ),
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

  String _formatLocation(Map<String, dynamic> location) {
    if (location.containsKey('address')) {
      return location['address'] as String;
    }
    if (location.containsKey('latitude') && location.containsKey('longitude')) {
      return '${location['latitude']}, ${location['longitude']}';
    }
    return 'Location specified';
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return AppDateUtils.DateUtils.formatDate(date);
    } catch (e) {
      return dateString;
    }
  }
}

