import 'package:budgetly/core/db/tables/expenses.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../app_database.dart';

part 'expenses_dao.g.dart';

@injectable
@DriftAccessor(tables: [Expenses])
class ExpensesDao extends DatabaseAccessor<AppDatabase> with _$ExpensesDaoMixin {
  ExpensesDao(super.db);

  Future<int> insertExpense(ExpensesCompanion expense) =>
      into(expenses).insert(expense);

  Future<List<Expense>> getExpensesByDay(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    return (select(expenses)
      ..where((tbl) => tbl.date.isBetweenValues(start, end))
      ..orderBy([(e) => OrderingTerm.desc(e.date)]))
        .get();
  }

  Future<List<Expense>> getAllExpenses() {
    return (select(expenses)
      ..orderBy([(e) => OrderingTerm.desc(e.date)]))
        .get();
  }

  Future<bool> updateExpenseById(int id, ExpensesCompanion updatedExpense) async {
    final updatedCount = await (update(expenses)..where((tbl) => tbl.id.equals(id)))
        .write(updatedExpense);
    return updatedCount > 0;
  }

  Future<bool> deleteExpense(int id) async {
    final count = await (delete(expenses)..where((tbl) => tbl.id.equals(id))).go();
    return count > 0;
  }

  Future<int> deleteAllExpenses() async {
    return await (delete(expenses)).go();
  }

  Future<int> deleteExpensesByDay(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    return await (delete(expenses)
      ..where((tbl) => tbl.date.isBetweenValues(start, end)))
        .go();
  }
}