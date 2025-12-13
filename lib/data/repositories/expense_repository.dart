import '../api/expense_api.dart';
import '../../models/expense.dart';

class ExpenseRepository {
  final ExpenseApi _expenseApi;

  ExpenseRepository(this._expenseApi);

  Future<List<Expense>> getExpenses(String missionId) async {
    return await _expenseApi.getExpenses(missionId);
  }

  Future<Expense> createExpense(Expense expense) async {
    return await _expenseApi.createExpense(expense);
  }

  Future<Expense> updateExpense(Expense expense) async {
    return await _expenseApi.updateExpense(expense);
  }

  Future<void> deleteExpense(String expenseId) async {
    await _expenseApi.deleteExpense(expenseId);
  }
}

