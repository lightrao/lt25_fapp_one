// counter_service.dart
class CounterService {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    print('Counter incremented: $_counter');
  }
}
