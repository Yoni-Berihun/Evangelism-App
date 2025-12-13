import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/mission_provider.dart';
import '../../providers/outreach_provider.dart';
import '../../providers/auth_provider.dart';
import '../widgets/counter_button.dart';
import '../widgets/success_dialog.dart';
import '../../models/outreach_data.dart';

class MissionaryLogImpactScreen extends ConsumerStatefulWidget {
  const MissionaryLogImpactScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MissionaryLogImpactScreen> createState() =>
      _MissionaryLogImpactScreenState();
}

class _MissionaryLogImpactScreenState
    extends ConsumerState<MissionaryLogImpactScreen> {
  int _soulsSaved = 0;
  int _baptisms = 0;
  final _testimoniesController = TextEditingController();
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final userMission = ref.watch(userMissionProvider);

    if (_isSubmitted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.missionaryLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                size: 48,
                color: AppColors.missionaryPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Impact Logged Successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your work is making a difference.',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.missionaryLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  if (_soulsSaved > 0)
                    Text('✓ $_soulsSaved souls saved',
                        style: const TextStyle(
                            color: AppColors.missionaryPrimary)),
                  if (_baptisms > 0)
                    Text('✓ $_baptisms baptisms',
                        style: const TextStyle(
                            color: AppColors.missionaryPrimary)),
                  if (_testimoniesController.text.isNotEmpty)
                    const Text('✓ Testimony recorded',
                        style: TextStyle(color: AppColors.missionaryPrimary)),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return userMission.when(
      data: (mission) {
        if (mission == null) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('📋', style: TextStyle(fontSize: 48)),
                SizedBox(height: 16),
                Text(
                  'No Mission Assigned',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
          padding: const EdgeInsets.all(24),
          children: [
            // Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log Your Impact',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Mission: ${mission.missionName}',
                  style:
                      const TextStyle(fontSize: 14, color: AppColors.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Souls Saved Counter
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Souls Saved',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CounterButton(
                        icon: Icons.remove,
                        onPressed: () {
                          if (_soulsSaved > 0) {
                            setState(() => _soulsSaved--);
                          }
                        },
                        backgroundColor: Colors.grey.shade100,
                        iconColor: Colors.grey.shade600,
                      ),
                      Text(
                        '$_soulsSaved',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.missionaryPrimary,
                        ),
                      ),
                      CounterButton(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() => _soulsSaved++);
                        },
                        backgroundColor: AppColors.missionaryPrimary,
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Baptisms Counter
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Baptisms',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CounterButton(
                        icon: Icons.remove,
                        onPressed: () {
                          if (_baptisms > 0) {
                            setState(() => _baptisms--);
                          }
                        },
                        backgroundColor: Colors.grey.shade100,
                        iconColor: Colors.grey.shade600,
                      ),
                      Text(
                        '$_baptisms',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.missionaryPrimary,
                        ),
                      ),
                      CounterButton(
                        icon: Icons.add,
                        onPressed: () {
                          setState(() => _baptisms++);
                        },
                        backgroundColor: AppColors.missionaryPrimary,
                        iconColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Testimonies
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Testimonies',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _testimoniesController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      hintText: 'Share the stories of lives transformed...',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_testimoniesController.text.length} characters',
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Submit Button
            ElevatedButton(
              onPressed: _canSubmit() ? _submitForm : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.missionaryPrimary,
                disabledBackgroundColor: Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Submit Impact Log',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(24),
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

  bool _canSubmit() {
    return _soulsSaved > 0 ||
        _baptisms > 0 ||
        _testimoniesController.text.trim().isNotEmpty;
  }

  void _submitForm() async {
    final mission = await ref.read(userMissionProvider.future);
    if (mission == null) return;

    final accountId = ref.read(currentAccountIdProvider);
    final user = ref.read(authNotifierProvider).valueOrNull;
    if (user == null) return;

    final outreachData = OutreachData(
      id: '',
      accountId: accountId,
      missionId: mission.id,
      userId: user.id,
      userName: user.fullName,
      soulsSaved: _soulsSaved,
      baptisms: _baptisms,
      testimonies:
          _testimoniesController.text.trim().isEmpty
              ? null
              : _testimoniesController.text,
      date: DateTime.now(),
      createdAt: DateTime.now(),
    );

    try {
      await ref
          .read(outreachNotifierProvider(mission.id).notifier)
          .addOutreachData(outreachData);

      setState(() => _isSubmitted = true);

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isSubmitted = false;
            _soulsSaved = 0;
            _baptisms = 0;
            _testimoniesController.clear();
          });
        }
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error logging impact: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _testimoniesController.dispose();
    super.dispose();
  }
}

