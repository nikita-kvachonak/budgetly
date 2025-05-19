// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budgetly/core/db/app_database.dart' as _i47;
import 'package:budgetly/core/db/dao/expenses_dao.dart' as _i1027;
import 'package:budgetly/features/expenses/core/data/expense_repository_impl.dart'
    as _i770;
import 'package:budgetly/features/expenses/core/domain/repository/expense_repository.dart'
    as _i880;
import 'package:budgetly/features/expenses/core/domain/usecase/delete_all_expense_usecase.dart'
    as _i4;
import 'package:budgetly/features/expenses/core/domain/usecase/delete_expense_usecase.dart'
    as _i38;
import 'package:budgetly/features/expenses/core/domain/usecase/delete_expenses_by_day_usecase.dart'
    as _i308;
import 'package:budgetly/features/expenses/core/domain/usecase/get_all_expenses_usecase.dart'
    as _i80;
import 'package:budgetly/features/expenses/core/domain/usecase/get_expenses_by_day_usecase.dart'
    as _i488;
import 'package:budgetly/features/expenses/core/domain/usecase/insert_expense_usecase.dart'
    as _i827;
import 'package:budgetly/features/expenses/core/domain/usecase/update_expense_by_id_usecase.dart'
    as _i541;
import 'package:budgetly/features/expenses/dashboard/presentation/bloc/expenses_bloc.dart'
    as _i86;
import 'package:budgetly/features/expenses/stats/presentation/bloc/stats_bloc.dart'
    as _i437;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> $initMainGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final databaseModule = _$DatabaseModule();
    await gh.lazySingletonAsync<_i47.AppDatabase>(
      () => databaseModule.database,
      preResolve: true,
    );
    gh.factory<_i1027.ExpensesDao>(
      () => _i1027.ExpensesDao(gh<_i47.AppDatabase>()),
    );
    gh.singleton<_i880.ExpenseRepository>(
      () => _i770.ExpenseRepositoryImpl(gh<_i1027.ExpensesDao>()),
    );
    gh.factory<_i4.DeleteAllExpensesUseCase>(
      () => _i4.DeleteAllExpensesUseCase(gh<_i880.ExpenseRepository>()),
    );
    gh.factory<_i308.DeleteExpensesByDayUseCase>(
      () => _i308.DeleteExpensesByDayUseCase(gh<_i880.ExpenseRepository>()),
    );
    gh.factory<_i80.GetAllExpensesUseCase>(
      () => _i80.GetAllExpensesUseCase(gh<_i880.ExpenseRepository>()),
    );
    gh.factory<_i541.UpdateExpenseByIdUseCase>(
      () => _i541.UpdateExpenseByIdUseCase(gh<_i880.ExpenseRepository>()),
    );
    gh.factory<_i488.GetExpensesByDayUseCase>(
      () => _i488.GetExpensesByDayUseCase(gh<_i880.ExpenseRepository>()),
    );
    gh.factory<_i827.InsertExpenseUseCase>(
      () => _i827.InsertExpenseUseCase(gh<_i880.ExpenseRepository>()),
    );
    gh.factory<_i38.DeleteExpenseUseCase>(
      () => _i38.DeleteExpenseUseCase(gh<_i880.ExpenseRepository>()),
    );
    gh.factory<_i437.StatsBloc>(
      () => _i437.StatsBloc(
        gh<_i80.GetAllExpensesUseCase>(),
        gh<_i488.GetExpensesByDayUseCase>(),
      ),
    );
    gh.factory<_i86.ExpensesBloc>(
      () => _i86.ExpensesBloc(
        gh<_i80.GetAllExpensesUseCase>(),
        gh<_i488.GetExpensesByDayUseCase>(),
        gh<_i827.InsertExpenseUseCase>(),
        gh<_i541.UpdateExpenseByIdUseCase>(),
        gh<_i38.DeleteExpenseUseCase>(),
        gh<_i4.DeleteAllExpensesUseCase>(),
        gh<_i308.DeleteExpensesByDayUseCase>(),
      ),
    );
    return this;
  }
}

class _$DatabaseModule extends _i47.DatabaseModule {}
