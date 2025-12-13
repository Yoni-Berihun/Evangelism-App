import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/filter_provider.dart';

class FilterBar extends StatelessWidget {
  final FilterType filterType;
  final DateRange dateRange;
  final Function(FilterType) onFilterTypeChanged;
  final Function(DateRange) onDateRangeChanged;
  final Color accentColor;

  const FilterBar({
    Key? key,
    required this.filterType,
    required this.dateRange,
    required this.onFilterTypeChanged,
    required this.onDateRangeChanged,
    required this.accentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Expanded(
              child: _buildDropdown<FilterType>(
                value: filterType,
                items: const [
                  DropdownMenuItem(value: FilterType.souls, child: Text('Souls Saved')),
                  DropdownMenuItem(value: FilterType.baptisms, child: Text('Baptisms')),
                  DropdownMenuItem(value: FilterType.testimonies, child: Text('Testimonies')),
                  DropdownMenuItem(value: FilterType.expenses, child: Text('Expenses')),
                ],
                onChanged: (value) {
                  if (value != null) onFilterTypeChanged(value);
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDropdown<DateRange>(
                value: dateRange,
                items: const [
                  DropdownMenuItem(value: DateRange.week, child: Text('This Week')),
                  DropdownMenuItem(value: DateRange.month, child: Text('This Month')),
                  DropdownMenuItem(value: DateRange.year, child: Text('This Year')),
                  DropdownMenuItem(value: DateRange.all, child: Text('All Time')),
                ],
                onChanged: (value) {
                  if (value != null) onDateRangeChanged(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T value,
    required List<DropdownMenuItem<T>> items,
    required Function(T?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<T>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}

