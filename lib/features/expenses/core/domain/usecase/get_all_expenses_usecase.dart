import 'package:budgetly/core/db/app_database.dart';
import 'package:budgetly/core/usecase/usecases.dart';

import 'package:budgetly/features/expenses/core/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllExpensesUseCase extends UseCase<List<Expense>, NoParams> {
  final ExpenseRepository repository;

  GetAllExpensesUseCase(this.repository);

  @override
  Future<List<Expense>> call(NoParams params) {
    return repository.getAllExpenses();
  }
}