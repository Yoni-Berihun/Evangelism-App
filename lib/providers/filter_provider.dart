import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_provider.freezed.dart';
part 'filter_provider.g.dart';

enum FilterType { souls, baptisms, testimonies, expenses }

enum DateRange { week, month, year, all }

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    @Default(FilterType.souls) FilterType filterType,
    @Default(DateRange.all) DateRange dateRange,
  }) = _FilterState;
}

@riverpod
class FilterNotifier extends _$FilterNotifier {
  @override
  FilterState build() {
    return const FilterState(
      filterType: FilterType.souls,
      dateRange: DateRange.all,
    );
  }

  void setFilterType(FilterType type) {
    state = state.copyWith(filterType: type);
  }

  void setDateRange(DateRange range) {
    state = state.copyWith(dateRange: range);
  }
}

