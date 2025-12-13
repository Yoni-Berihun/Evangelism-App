import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

enum ExpenseCategory {
  @JsonValue('travel')
  travel,
  @JsonValue('food')
  food,
  @JsonValue('supplies')
  supplies,
  @JsonValue('accommodation')
  accommodation,
  @JsonValue('other')
  other,
}

@freezed
class Expense with _$Expense {
  const factory Expense({
    required String id,
    required String accountId,
    required String missionId,
    required String userId,
    required String userName,
    required ExpenseCategory category,
    required double amount,
    required String description,
    required DateTime date,
    required DateTime createdAt,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}

