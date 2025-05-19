import 'package:budgetly/core/db/app_database.dart';
import 'package:budgetly/core/usecase/usecases.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/get_all_expenses_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/delete_expense_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/get_expenses_by_day_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/insert_expense_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/update_expense_by_id_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'stats_bloc.freezed.dart';

@injectable
class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final GetAllExpensesUseCase getAllExpenses;
  final GetExpensesByDayUseCase getByDay;

  StatsBloc(
    this.getAllExpenses,
    this.getByDay,
  ) : super(const StatsState()) {
    on<_Started>(_onStarted);
    on<_GetByDay>(_onGetByDay);
  }

  Future<void> _onStarted(_Started event, Emitter<StatsState> emit) async {
    emit(state.copyWith(status: ExpensesStatus.loading));
    //await Future.delayed(Duration(seconds: 1));
    try {
      final all = await getAllExpenses(NoParams());
      emit(
        state.copyWith(status: ExpensesStatus.success, expenses: List.of(all)),
      );
    } catch (_) {
      emit(state.copyWith(status: ExpensesStatus.error));
    }
  }

  Future<void> _onGetByDay(_GetByDay event, Emitter<StatsState> emit) async {
    emit(state.copyWith(status: ExpensesStatus.fetching));
    try {
      final list = await getByDay(event.date);
      emit(state.copyWith(status: ExpensesStatus.success, expenses: list));
    } catch (_) {
      emit(state.copyWith(status: ExpensesStatus.error));
    }
  }
}

@freezed
class StatsEvent with _$StatsEvent {
  const factory StatsEvent.started() = _Started;

  const factory StatsEvent.getByDay(DateTime date) = _GetByDay;
}

enum ExpensesStatus { fetching, loading, success, error }

@freezed
abstract class StatsState with _$StatsState {
  const factory StatsState({
    @Default(ExpensesStatus.fetching) ExpensesStatus status,
    @Default([]) List<Expense> expenses,
  }) = _StatsState;
}
