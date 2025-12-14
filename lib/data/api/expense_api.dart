import '../api_client.dart';
import '../../models/expense.dart';
import '../../core/constants/api_constants.dart';

class ExpenseApi {
  final ApiClient _apiClient;

  ExpenseApi(this._apiClient);

  Future<List<Expense>> getExpenses({
    String? missionId,
    int skip = 0,
    int limit = 100,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'skip': skip,
        'limit': limit,
      };
      
      if (missionId != null) {
        queryParams['mission_id'] = missionId;
      }

      final response = await _apiClient.dio.get(
        ApiConstants.expenses,
        queryParameters: queryParams,
      );

      return (response.data as List)
          .map((json) => Expense.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch expenses: ${e.toString()}');
    }
  }

  Future<Expense> createExpense(Map<String, dynamic> expenseData) async {
    try {
      final response = await _apiClient.dio.post(
        ApiConstants.expenses,
        data: expenseData,
      );
      return Expense.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to create expense: ${e.toString()}');
    }
  }

  Future<Expense> updateExpense(String expenseId, Map<String, dynamic> expenseData) async {
    try {
      final response = await _apiClient.dio.put(
        '${ApiConstants.expenses}/$expenseId',
        data: expenseData,
      );
      return Expense.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to update expense: ${e.toString()}');
    }
  }

  Future<void> deleteExpense(String expenseId) async {
    try {
      await _apiClient.dio.delete('${ApiConstants.expenses}/$expenseId');
    } catch (e) {
      throw Exception('Failed to delete expense: ${e.toString()}');
    }
  }
}

