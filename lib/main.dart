import 'package:flutter/material.dart';

import 'core/db/app_database.dart';
import 'core/di/dependency_container.dart';
import 'core/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await resolveDependencies();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final globalAppRouter = AppRouter(navigatorKey: navigatorKey);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: globalAppRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Budgetly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}