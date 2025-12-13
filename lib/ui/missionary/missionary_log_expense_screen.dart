import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/validators.dart';
import '../../models/expense.dart';
import '../../providers/mission_provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/expense_provider.dart';
import '../widgets/success_dialog.dart';

class MissionaryLogExpenseScreen extends ConsumerStatefulWidget {
  const MissionaryLogExpenseScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MissionaryLogExpenseScreen> createState() =>
      _MissionaryLogExpenseScreenState();
}

class _MissionaryLogExpenseScreenState
    extends ConsumerState<MissionaryLogExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  ExpenseCategory _selectedCategory = ExpenseCategory.other;
  DateTime _selectedDate = DateTime.now();
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    final userMission = ref.watch(userMissionProvider);

    if (_isSubmitted) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 64, color: AppColors.green),
            SizedBox(height: 16),
            Text(
              'Expense Logged Successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    }

    return userMission.when(
      data: (mission) {
        if (mission == null) {
          return const Center(
            child: Text('No mission assigned'),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'Log Expense',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Amount
                  _buildCard(
                    child: TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                      validator: Validators.validateAmount,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Category
                  _buildCard(
                    child: DropdownButtonFormField<ExpenseCategory>(
                      value: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      items: ExpenseCategory.values.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(_getCategoryName(category)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _selectedCategory = value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  _buildCard(
                    child: TextFormField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          Validators.validateRequired(value, 'description'),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Date
                  _buildCard(
                    child: GestureDetector(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() => _selectedDate = date);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Date'),
                            Text(DateFormat('MMM dd, yyyy').format(_selectedDate)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.missionaryPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Submit Expense',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
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

  String _getCategoryName(ExpenseCategory category) {
    switch (category) {
      case ExpenseCategory.travel:
        return 'Travel';
      case ExpenseCategory.food:
        return 'Food';
      case ExpenseCategory.supplies:
        return 'Supplies';
      case ExpenseCategory.accommodation:
        return 'Accommodation';
      case ExpenseCategory.other:
        return 'Other';
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final mission = await ref.read(userMissionProvider.future);
      if (mission == null) return;

      final accountId = ref.read(currentAccountIdProvider);
      final user = ref.read(authNotifierProvider).valueOrNull;
      if (user == null) return;

      final expense = Expense(
        id: '',
        accountId: accountId,
        missionId: mission.id,
        userId: user.id,
        userName: user.fullName,
        category: _selectedCategory,
        amount: double.parse(_amountController.text),
        description: _descriptionController.text,
        date: _selectedDate,
        createdAt: DateTime.now(),
      );

      try {
        await ref
            .read(expenseNotifierProvider(mission.id).notifier)
            .addExpense(expense);

        setState(() => _isSubmitted = true);

        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            setState(() {
              _isSubmitted = false;
              _amountController.clear();
              _descriptionController.clear();
              _selectedDate = DateTime.now();
            });
          }
        });
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error logging expense: $e')),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

