import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
  const factory Expense({
    required String id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'mission_id') String? missionId, // Optional
    @JsonKey(name: 'user_id') required String userId,
    required String category, // String, not enum
    required double amount,
    String? description,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}

