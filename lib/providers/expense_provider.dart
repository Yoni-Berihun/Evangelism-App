import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/api/api_client.dart';
import '../data/api/expense_api.dart';
import '../data/repositories/expense_repository.dart';
import '../models/expense.dart';

part 'expense_provider.g.dart';

@riverpod
ExpenseApi expenseApi(ExpenseApiRef ref) {
  return ExpenseApi(ref.watch(apiClientProvider));
}

@riverpod
ExpenseRepository expenseRepository(ExpenseRepositoryRef ref) {
  return ExpenseRepository(ref.watch(expenseApiProvider));
}

@riverpod
Future<List<Expense>> expenses(ExpensesRef ref, {String? missionId}) async {
  return ref.read(expenseRepositoryProvider).getExpenses(missionId: missionId);
}

@riverpod
class ExpenseNotifier extends _$ExpenseNotifier {
  late String _missionId;

  @override
  Future<List<Expense>> build(String? missionId) async {
    _missionId = missionId;
    return ref.read(expenseRepositoryProvider).getExpenses(missionId: missionId);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final expenses =
          await ref.read(expenseRepositoryProvider).getExpenses(missionId: _missionId);
      state = AsyncValue.data(expenses);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> addExpense(Map<String, dynamic> expenseData) async {
    try {
      await ref.read(expenseRepositoryProvider).createExpense(expenseData);
      state = const AsyncValue.loading();
      final updatedExpenses =
          await ref.read(expenseRepositoryProvider).getExpenses(missionId: _missionId);
      state = AsyncValue.data(updatedExpenses);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> updateExpense(String expenseId, Map<String, dynamic> expenseData) async {
    try {
      await ref.read(expenseRepositoryProvider).updateExpense(expenseId, expenseData);
      state = const AsyncValue.loading();
      final updatedExpenses =
          await ref.read(expenseRepositoryProvider).getExpenses(missionId: _missionId);
      state = AsyncValue.data(updatedExpenses);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> deleteExpense(String expenseId) async {
    try {
      await ref.read(expenseRepositoryProvider).deleteExpense(expenseId);
      state = const AsyncValue.loading();
      final updatedExpenses =
          await ref.read(expenseRepositoryProvider).getExpenses(_missionId);
      state = AsyncValue.data(updatedExpenses);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}

