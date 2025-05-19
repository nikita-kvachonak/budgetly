import 'package:budgetly/core/usecase/usecases.dart';
import 'package:budgetly/features/expenses/core/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteAllExpensesUseCase {
  final ExpenseRepository _repository;

  DeleteAllExpensesUseCase(this._repository);

  Future<int> call() {
    return _repository.deleteAllExpenses();
  }
}
