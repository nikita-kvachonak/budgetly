import 'package:budgetly/core/db/app_database.dart';
import 'package:budgetly/core/usecase/usecases.dart';

import 'package:budgetly/features/expenses/core/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertExpenseUseCase extends UseCase<int, ExpensesCompanion> {
  final ExpenseRepository repository;

  InsertExpenseUseCase(this.repository);

  @override
  Future<int> call(ExpensesCompanion params) {
    return repository.insertExpense(params);
  }
}
