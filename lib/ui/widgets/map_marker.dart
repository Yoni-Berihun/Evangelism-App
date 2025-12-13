import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../core/constants/app_colors.dart';
import '../../models/mission.dart';
import '../../providers/filter_provider.dart';

class MapMarkerWidget extends StatelessWidget {
  final Mission mission;
  final FilterType filterType;
  final VoidCallback onTap;

  const MapMarkerWidget({
    Key? key,
    required this.mission,
    required this.filterType,
    required this.onTap,
  }) : super(key: key);

  Color _getMarkerColor() {
    // This would be based on actual data for the filter type
    // For now, return a default color
    switch (filterType) {
      case FilterType.souls:
        return AppColors.markerLow;
      case FilterType.baptisms:
        return AppColors.markerMedium;
      case FilterType.testimonies:
        return AppColors.markerHigh;
      case FilterType.expenses:
        return AppColors.markerHighlight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getMarkerColor();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}

