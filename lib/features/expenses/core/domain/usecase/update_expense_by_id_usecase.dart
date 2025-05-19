import 'package:budgetly/core/db/app_database.dart';
import 'package:budgetly/core/usecase/usecases.dart';

import 'package:budgetly/features/expenses/core/domain/repository/expense_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateExpenseByIdUseCase extends UseCase<bool, UpdateExpenseByIdParams> {
  final ExpenseRepository repository;

  UpdateExpenseByIdUseCase(this.repository);

  @override
  Future<bool> call(UpdateExpenseByIdParams params) {
    return repository.updateExpenseById(params.id, params.updated);
  }
}

class UpdateExpenseByIdParams {
  final int id;
  final ExpensesCompanion updated;

  UpdateExpenseByIdParams(this.id, this.updated);
}
