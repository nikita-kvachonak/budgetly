import 'package:auto_route/annotations.dart';
import 'package:budgetly/core/constants/expense_categories.dart';
import 'package:budgetly/core/db/app_database.dart';
import 'package:budgetly/core/di/dependency_container.dart';
import 'package:budgetly/core/widgets/error.dart';
import 'package:budgetly/core/widgets/loading.dart';
import 'package:budgetly/features/expenses/dialogs/add_expense_dialog.dart';
import 'package:drift/drift.dart' hide Column;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/expenses_bloc.dart';

@RoutePage()
class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final bloc = sl.get<ExpensesBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(const ExpensesEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('My expenses for today'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                final newExpense = await showDialog<ExpensesCompanion>(
                  context: context,
                  builder: (context) => AddExpenseDialog(),
                );
                if (newExpense != null) {
                  bloc.add(ExpensesEvent.insert(newExpense));
                }
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                bloc.add(ExpensesEvent.deleteByDay(DateTime.now()));
              },
              icon: Icon(Icons.delete),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<ExpensesBloc, ExpensesState>(
          builder: (context, state) {
            if (state.status == ExpensesStatus.loading) return AppLoadingWidget();
            if (state.status == ExpensesStatus.error) {
              return AppErrorWidget(e: state.error);
            }

            if (state.expenses.isEmpty) return const Center(child: Text('No expenses'));

            return _content(context);
          },
        ),
      ),
    );
  }
}

Widget _content(BuildContext context) {
  final state = context.watch<ExpensesBloc>().state;

  return ListView.separated(
    itemCount: state.expenses.length,
    separatorBuilder: (_, __) => const Divider(),
    itemBuilder: (context, index) {
      final expense = state.expenses[index];
      return _item(context, expense);
    },
  );
}

Widget _item(BuildContext context, Expense expense) {
  final bloc = context.read<ExpensesBloc>();

  final formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(expense.date.toLocal());

  return Dismissible(
    key: ValueKey(expense.id),
    direction: DismissDirection.endToStart,
    background: Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.redAccent,
      child: const Icon(Icons.delete_forever, color: Colors.white, size: 32),
    ),
    confirmDismiss: (direction) async {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Delete expense?'),
          content: Text('Are you sure you want to delete "${expense.category}" expense?'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
            TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Delete')),
          ],
        ),
      );
      return confirmed == true;
    },
    onDismissed: (direction) {
      bloc.add(ExpensesEvent.delete(expense.id));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Deleted expense "${expense.category}"')),
      );
    },
    child: Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
          child: Text(
            expense.category.isNotEmpty ? expense.category[0].toUpperCase() : '?',
            style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          '${expense.category.toUpperCase()}: ${expense.amount.toStringAsFixed(2)} ${expense.currency ?? ''}',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          expense.comment == null || expense.comment!.isEmpty
              ? formattedDate
              : '${expense.comment} — $formattedDate',
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ),
    ),
  );
}

