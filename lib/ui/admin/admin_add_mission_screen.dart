import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/validators.dart';
import '../../models/mission.dart';
import '../../providers/mission_provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/account_provider.dart';
import '../widgets/success_dialog.dart';

class AdminAddMissionScreen extends ConsumerStatefulWidget {
  const AdminAddMissionScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminAddMissionScreen> createState() =>
      _AdminAddMissionScreenState();
}

class _AdminAddMissionScreenState
    extends ConsumerState<AdminAddMissionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _missionNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _teamNameController = TextEditingController();
  final _budgetController = TextEditingController();

  double? _latitude;
  double? _longitude;
  DateTime? _startDate;
  DateTime? _endDate;
  String? _selectedMissionary;

  final List<Map<String, dynamic>> _locationPresets = [
    {'name': 'New York, NY', 'lat': 40.7128, 'lng': -74.0060},
    {'name': 'Los Angeles, CA', 'lat': 34.0522, 'lng': -118.2437},
    {'name': 'Chicago, IL', 'lat': 41.8781, 'lng': -87.6298},
    {'name': 'Houston, TX', 'lat': 29.7604, 'lng': -95.3698},
    {'name': 'Phoenix, AZ', 'lat': 33.4484, 'lng': -112.0740},
    {'name': 'Philadelphia, PA', 'lat': 39.9526, 'lng': -75.1652},
  ];

  @override
  Widget build(BuildContext context) {
    final missionaries = ref.watch(missionariesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Mission'),
        backgroundColor: AppColors.adminPrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // Mission Name Card
            _buildCard(
              child: TextFormField(
                controller: _missionNameController,
                decoration: const InputDecoration(
                  labelText: 'Mission Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequired(value, 'mission name'),
              ),
            ),
            const SizedBox(height: 16),

            // Location Card
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppColors.adminPrimary),
                      const SizedBox(width: 8),
                      const Text('Location',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      hintText: 'Select from presets or enter custom',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        Validators.validateRequired(value, 'location'),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _locationPresets.map((preset) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _locationController.text = preset['name'];
                            _latitude = preset['lat'];
                            _longitude = preset['lng'];
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.adminLight,
                          foregroundColor: AppColors.adminPrimary,
                        ),
                        child: Text(preset['name'],
                            style: const TextStyle(fontSize: 12)),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Team Name Card
            _buildCard(
              child: TextFormField(
                controller: _teamNameController,
                decoration: const InputDecoration(
                  labelText: 'Team Name',
                  prefixIcon: Icon(Icons.group),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequired(value, 'team name'),
              ),
            ),
            const SizedBox(height: 16),

            // Dates Card
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          color: AppColors.adminPrimary),
                      const SizedBox(width: 8),
                      const Text('Mission Dates',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDateField(
                          label: 'Start Date',
                          date: _startDate,
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2030),
                            );
                            if (date != null) {
                              setState(() => _startDate = date);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDateField(
                          label: 'End Date',
                          date: _endDate,
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: _startDate ?? DateTime.now(),
                              firstDate: _startDate ?? DateTime.now(),
                              lastDate: DateTime(2030),
                            );
                            if (date != null) {
                              setState(() => _endDate = date);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Budget Card
            _buildCard(
              child: TextFormField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Budget',
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(),
                ),
                validator: Validators.validateAmount,
              ),
            ),
            const SizedBox(height: 16),

            // Assign Missionary Card
            missionaries.when(
              data: (users) => _buildCard(
                child: DropdownButtonFormField<String>(
                  value: _selectedMissionary,
                  decoration: const InputDecoration(
                    labelText: 'Assign Missionary',
                    border: OutlineInputBorder(),
                  ),
                  items: users.map((user) {
                    return DropdownMenuItem(
                      value: user.id,
                      child: Text(user.fullName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => _selectedMissionary = value);
                  },
                ),
              ),
              loading: () => const SizedBox(),
              error: (_, __) => const SizedBox(),
            ),
            const SizedBox(height: 24),

            // Submit Button
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.adminPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Create Mission',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
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
      child: child,
    );
  }

  Widget _buildDateField({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontSize: 12, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              date != null
                  ? DateFormat('MMM dd, yyyy').format(date)
                  : 'Select date',
              style: TextStyle(
                fontSize: 14,
                color:
                    date != null ? AppColors.textPrimary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_startDate == null || _endDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select mission dates')),
        );
        return;
      }

      if (_latitude == null || _longitude == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a location')),
        );
        return;
      }

      final accountIdAsync = ref.read(currentAccountIdProvider);
      final accountId = await accountIdAsync.valueOrNull;
      if (accountId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No account selected')),
        );
        return;
      }
      final missionData = <String, dynamic>{
        'account_id': accountId,
        'name': _missionNameController.text,
        'location': {
          'address': _locationController.text,
          'latitude': _latitude!,
          'longitude': _longitude!,
        },
        if (_startDate != null) 'start_date': _startDate!.toIso8601String(),
        if (_endDate != null) 'end_date': _endDate!.toIso8601String(),
        if (_budgetController.text.isNotEmpty)
          'budget': double.parse(_budgetController.text),
      };

      try {
        await ref.read(missionNotifierProvider.notifier).addMission(missionData);

        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => const SuccessDialog(
              title: 'Mission Created Successfully!',
              message: 'The mission has been added to the system.',
            ),
          );

          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop(); // Close dialog
            Navigator.of(context).pop(); // Return to home
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error creating mission: $e')),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _missionNameController.dispose();
    _locationController.dispose();
    _teamNameController.dispose();
    _budgetController.dispose();
    super.dispose();
  }
}

