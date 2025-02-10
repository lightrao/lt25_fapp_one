// service_locator.dart
import 'package:get_it/get_it.dart';
import 'my_service.dart';

// final getIt = GetIt.instance;

void setupLocator() {
  // Register MyService as a lazy singleton.
  // It will only be created when first requested.
  // getIt.registerLazySingleton<MyService>(() => MyService());
  GetIt.instance.registerLazySingleton<MyService>(() => MyService());
}
