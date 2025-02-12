import 'package:flutter/foundation.dart';
import '../models/counter_model.dart';

class CounterController extends ChangeNotifier {
  final CounterModel counterModel = CounterModel();

  void increment() {
    counterModel.increment();
    notifyListeners(); // Tell the view about the change.
  }
}
