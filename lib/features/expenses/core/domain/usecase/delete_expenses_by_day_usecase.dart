import 'package:budgetly/core/usecase/usecases.dart';
import 'package:budgetly/features/expenses/core/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteExpensesByDayUseCase {
  final ExpenseRepository _repository;

  DeleteExpensesByDayUseCase(this._repository);

  Future<int> call(DateTime date) {
    return _repository.deleteExpensesByDay(date);
  }
}
