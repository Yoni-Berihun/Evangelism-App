import '../api_client.dart';
import '../../models/expense.dart';

class ExpenseApi {
  final ApiClient _apiClient;

  ExpenseApi(this._apiClient);

  Future<List<Expense>> getExpenses(String missionId) async {
    try {
      final response = await _apiClient.dio.get(
        '/expenses',
        queryParameters: {'mission_id': missionId},
      );

      return (response.data as List)
          .map((json) => Expense.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch expenses: $e');
    }
  }

  Future<Expense> createExpense(Expense expense) async {
    try {
      final response = await _apiClient.dio.post(
        '/expenses',
        data: expense.toJson(),
      );
      return Expense.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create expense: $e');
    }
  }

  Future<Expense> updateExpense(Expense expense) async {
    try {
      final response = await _apiClient.dio.put(
        '/expenses/${expense.id}',
        data: expense.toJson(),
      );
      return Expense.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update expense: $e');
    }
  }

  Future<void> deleteExpense(String expenseId) async {
    try {
      await _apiClient.dio.delete('/expenses/$expenseId');
    } catch (e) {
      throw Exception('Failed to delete expense: $e');
    }
  }
}

