import 'package:budgetly/core/db/app_database.dart';
import 'package:budgetly/core/usecase/usecases.dart';

import 'package:budgetly/features/expenses/core/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExpensesByDayUseCase extends UseCase<List<Expense>, DateTime> {
  final ExpenseRepository repository;

  GetExpensesByDayUseCase(this.repository);

  @override
  Future<List<Expense>> call(DateTime date) {
    return repository.getExpensesByDay(date);
  }
}

