import '../api/expense_api.dart';
import '../../models/expense.dart';

class ExpenseRepository {
  final ExpenseApi _expenseApi;

  ExpenseRepository(this._expenseApi);

  Future<List<Expense>> getExpenses({
    String? missionId,
    int skip = 0,
    int limit = 100,
  }) async {
    return await _expenseApi.getExpenses(
      missionId: missionId,
      skip: skip,
      limit: limit,
    );
  }

  Future<Expense> createExpense(Map<String, dynamic> expenseData) async {
    return await _expenseApi.createExpense(expenseData);
  }

  Future<Expense> updateExpense(String expenseId, Map<String, dynamic> expenseData) async {
    return await _expenseApi.updateExpense(expenseId, expenseData);
  }

  Future<void> deleteExpense(String expenseId) async {
    await _expenseApi.deleteExpense(expenseId);
  }
}

