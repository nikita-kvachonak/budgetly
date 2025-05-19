import 'package:auto_route/auto_route.dart';
import 'package:budgetly/core/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  AppRouter({super.navigatorKey});

  @override
  RouteType get defaultRouteType => RouteType.material();
  
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      children: [
        AutoRoute(page: ExpensesRoute.page, path: 'expenses'),
        AutoRoute(page: SettingsRoute.page, path: 'stats'),
        AutoRoute(page: StatsRoute.page, path: 'settings'),
      ],
    ),
  ];
}