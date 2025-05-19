import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'dao/expenses_dao.dart';
import 'tables/expenses.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Expenses], daos: [ExpensesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  late final expensesDao = ExpensesDao(this);

  // Вспомогательная функция для создания базы с подключением
  Future<AppDatabase> createDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'budgetly.sqlite'));
    final executor = NativeDatabase(file);
    return AppDatabase(executor);
  }
}

Future<AppDatabase> createDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File(p.join(dir.path, 'budgetly.sqlite'));
  final executor = NativeDatabase(file);
  return AppDatabase(executor);
}

@module
abstract class DatabaseModule {
  @preResolve
  @LazySingleton()
  Future<AppDatabase> get database => createDatabase();
}


