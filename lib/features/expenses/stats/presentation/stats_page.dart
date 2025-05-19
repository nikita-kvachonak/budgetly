import 'package:auto_route/auto_route.dart';
import 'package:budgetly/core/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:budgetly/core/di/dependency_container.dart';
import 'package:budgetly/core/db/app_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/stats_bloc.dart';
import 'chats/bar_chats_widget.dart';
import 'chats/pie_chart_widget.dart';

@RoutePage()
class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  late StatsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = sl.get<StatsBloc>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final tabsRouter = AutoTabsRouter.of(context);
    tabsRouter.addListener(() {
      if (tabsRouter.activeIndex == 1) {
        final today = DateTime.now();
        final onlyDate = DateTime(today.year, today.month, today.day);
        bloc.add(StatsEvent.getByDay(onlyDate));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Statistics"),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<StatsBloc, StatsState>(
          builder: (context, state) {
            if (state.status == ExpensesStatus.loading ||
                state.status == ExpensesStatus.fetching) {
              return const AppLoadingWidget();
            }

            if (state.expenses.isEmpty) {
              return const Center(child: Text('No expenses for today'));
            }

            final categoryTotals = _groupByCategory(state.expenses);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  BarChartWidget(data: categoryTotals),
                  const SizedBox(height: 32),
                  PieChartWidget(data: categoryTotals),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Map<String, double> _groupByCategory(List<Expense> expenses) {
    final map = <String, double>{};
    for (final e in expenses) {
      if (e.category.isEmpty) continue;
      map[e.category] = (map[e.category] ?? 0) + e.amount;
    }
    return map;
  }
}
