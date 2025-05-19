import 'package:budgetly/core/db/app_database.dart';
import 'package:budgetly/core/usecase/usecases.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/delete_all_expense_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/delete_expenses_by_day_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/get_all_expenses_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/delete_expense_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/get_expenses_by_day_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/insert_expense_usecase.dart';
import 'package:budgetly/features/expenses/core/domain/usecase/update_expense_by_id_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expenses_bloc.freezed.dart';

@injectable
@injectable
class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final GetAllExpensesUseCase getAllExpenses;
  final GetExpensesByDayUseCase getByDay;
  final InsertExpenseUseCase insert;
  final UpdateExpenseByIdUseCase update;
  final DeleteExpenseUseCase delete;
  final DeleteAllExpensesUseCase deleteAll;
  final DeleteExpensesByDayUseCase deleteByDay;

  ExpensesBloc(
    this.getAllExpenses,
    this.getByDay,
    this.insert,
    this.update,
    this.delete,
    this.deleteAll,
    this.deleteByDay,
  ) : super(const ExpensesState()) {
    on<_Started>(_onStarted);
    on<_GetByDay>(_onGetByDay);
    on<_Insert>(_onInsert);
    on<_Update>(_onUpdate);
    on<_Delete>(_onDelete);
    on<_DeleteAll>(_onDeleteAll);
    on<_DeleteByDay>(_onDeleteByDay);
  }

  Future<void> _onStarted(_Started event, Emitter<ExpensesState> emit) async {
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

  Future<void> _onGetByDay(_GetByDay event, Emitter<ExpensesState> emit) async {
    emit(state.copyWith(status: ExpensesStatus.fetching));
    try {
      final list = await getByDay(event.date);
      emit(state.copyWith(status: ExpensesStatus.success, expenses: list));
    } catch (_) {
      emit(state.copyWith(status: ExpensesStatus.error));
    }
  }

  Future<void> _onInsert(_Insert event, Emitter<ExpensesState> emit) async {
    try {
      await insert(event.expense);
      add(const ExpensesEvent.started());
    } catch (_) {
      emit(state.copyWith(status: ExpensesStatus.error));
    }
  }

  Future<void> _onUpdate(_Update event, Emitter<ExpensesState> emit) async {
    try {
      await update(UpdateExpenseByIdParams(event.id, event.updated));
      add(const ExpensesEvent.started());
    } catch (_) {
      emit(state.copyWith(status: ExpensesStatus.error));
    }
  }

  Future<void> _onDelete(_Delete event, Emitter<ExpensesState> emit) async {
    try {
      await delete(event.id);
      add(const ExpensesEvent.started());
    } catch (_) {
      emit(state.copyWith(status: ExpensesStatus.error));
    }
  }

  Future<void> _onDeleteAll(_DeleteAll event, Emitter<ExpensesState> emit) async {
    try {
      await deleteAll();
      add(const ExpensesEvent.started());
    } catch (_) {
      emit(state.copyWith(status: ExpensesStatus.error));
    }
  }

  Future<void> _onDeleteByDay(_DeleteByDay event, Emitter<ExpensesState> emit) async {
    try {
      await deleteByDay(event.date);
      add(const ExpensesEvent.started());
    } catch (_) {
      emit(state.copyWith(status: ExpensesStatus.error));
    }
  }
}

@freezed
class ExpensesEvent with _$ExpensesEvent {
  const factory ExpensesEvent.started() = _Started;

  const factory ExpensesEvent.getByDay(DateTime date) = _GetByDay;

  const factory ExpensesEvent.insert(ExpensesCompanion expense) = _Insert;

  const factory ExpensesEvent.update({
    required int id,
    required ExpensesCompanion updated,
  }) = _Update;

  const factory ExpensesEvent.delete(int id) = _Delete;

  const factory ExpensesEvent.deleteAll() = _DeleteAll;

  const factory ExpensesEvent.deleteByDay(DateTime date) = _DeleteByDay;
}

enum ExpensesStatus { fetching, loading, success, error }

@freezed
abstract class ExpensesState with _$ExpensesState {
  const factory ExpensesState({
    @Default(ExpensesStatus.fetching) ExpensesStatus status,
    @Default([]) List<Expense> expenses,
    @Default("") String error,
  }) = _ExpensesState;
}
