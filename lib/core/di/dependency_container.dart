import 'package:budgetly/core/di/dependency_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final sl = GetIt.instance; // service locator pattern

const currentEnvironment = Environment.dev;

@InjectableInit(
    initializerName: r'$initMainGetIt'
)
Future<void> resolveDependencies() async {
  await sl.$initMainGetIt(environment: currentEnvironment);
}
