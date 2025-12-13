import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/date_utils.dart';
import '../../models/mission.dart';
import '../../models/expense.dart';
import '../../providers/expense_provider.dart';
import '../../providers/mission_provider.dart';

class AdminExpenseDetailsScreen extends ConsumerWidget {
  final String missionId;

  const AdminExpenseDetailsScreen({
    Key? key,
    required this.missionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expensesProvider(missionId));
    final missions = ref.watch(missionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
        backgroundColor: AppColors.adminPrimary,
      ),
      body: expenses.when(
        data: (expenseList) {
          final total = expenseList.fold(
              0.0, (sum, expense) => sum + expense.amount);

          return Column(
            children: [
              // Summary Card
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.adminLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Expenses',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.adminPrimary,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.attach_money,
                      size: 48,
                      color: AppColors.adminPrimary,
                    ),
                  ],
                ),
              ),

              // Expense List
              Expanded(
                child: expenseList.isEmpty
                    ? const Center(child: Text('No expenses recorded'))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: expenseList.length,
                        itemBuilder: (context, index) {
                          final expense = expenseList[index];
                          return _buildExpenseCard(expense);
                        },
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

  Widget _buildExpenseCard(Expense expense) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.adminLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getCategoryIcon(expense.category),
              color: AppColors.adminPrimary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_getCategoryName(expense.category)} • ${DateUtils.formatDate(expense.date)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${expense.amount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.adminPrimary,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(ExpenseCategory category) {
    switch (category) {
      case ExpenseCategory.travel:
        return Icons.flight;
      case ExpenseCategory.food:
        return Icons.restaurant;
      case ExpenseCategory.supplies:
        return Icons.shopping_bag;
      case ExpenseCategory.accommodation:
        return Icons.hotel;
      case ExpenseCategory.other:
        return Icons.more_horiz;
    }
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
}

