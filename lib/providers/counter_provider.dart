import 'package:flutter/material.dart';
import '../models/counter_model.dart';

class CounterProvider with ChangeNotifier {
  final CounterModel _counter = CounterModel();

  CounterModel get counter => _counter;

  void increment() {
    _counter.count++;
    notifyListeners(); // Notify listeners about the change
  }
}
