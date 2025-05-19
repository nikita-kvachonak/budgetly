import 'package:budgetly/core/db/app_database.dart';

abstract class ExpenseRepository {
  Future<int> insertExpense(ExpensesCompanion expense);

  Future<List<Expense>> getExpensesByDay(DateTime date);

  Future<List<Expense>> getAllExpenses();

  Future<bool> updateExpenseById(int id, ExpensesCompanion updatedExpense);

  Future<bool> deleteExpense(int id);

  Future<int> deleteAllExpenses();

  Future<int> deleteExpensesByDay(DateTime date);
}
