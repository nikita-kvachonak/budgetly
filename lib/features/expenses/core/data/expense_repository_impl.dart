import 'package:budgetly/core/db/app_database.dart';
import 'package:injectable/injectable.dart';
import 'package:budgetly/core/db/dao/expenses_dao.dart';

import '../domain/repository/expense_repository.dart';

@Singleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpensesDao _dao;

  ExpenseRepositoryImpl(this._dao);

  @override
  Future<int> insertExpense(ExpensesCompanion expense) {
    return _dao.insertExpense(expense);
  }

  @override
  Future<List<Expense>> getExpensesByDay(DateTime date) {
    return _dao.getExpensesByDay(date);
  }

  @override
  Future<List<Expense>> getAllExpenses() {
    return _dao.getAllExpenses();
  }

  @override
  Future<bool> updateExpenseById(int id, ExpensesCompanion updatedExpense) {
    return _dao.updateExpenseById(id, updatedExpense);
  }

  @override
  Future<bool> deleteExpense(int id) {
    return _dao.deleteExpense(id);
  }

  @override
  Future<int> deleteAllExpenses() {
    return _dao.deleteAllExpenses();
  }

  @override
  Future<int> deleteExpensesByDay(DateTime date) {
    return _dao.deleteExpensesByDay(date);
  }
}
