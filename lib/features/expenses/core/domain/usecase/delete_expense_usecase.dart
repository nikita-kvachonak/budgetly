import 'package:budgetly/core/usecase/usecases.dart';
import 'package:budgetly/features/expenses/core/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteExpenseUseCase extends UseCase<bool, int> {
  final ExpenseRepository repository;

  DeleteExpenseUseCase(this.repository);

  @override
  Future<bool> call(int id) {
    return repository.deleteExpense(id);
  }
}
