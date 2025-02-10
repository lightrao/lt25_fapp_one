// locator.dart
import 'package:get_it/get_it.dart';
import 'counter_service.dart';

final locator = GetIt.instance; // Our central kitchen instance

void setupLocator() {
  locator.registerLazySingleton(
      () => CounterService()); // Registering CounterService as an ingredient
}
