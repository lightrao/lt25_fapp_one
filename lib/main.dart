import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// A simple model class that manages an integer counter.
// It extends ChangeNotifier so that it can notify listeners when changes occur.
class Counter with ChangeNotifier {
  int _count = 0; // Private variable to store the counter value.

  // Public getter to access the counter value.
  int get count => _count;

  // Method to increment the counter.
  void increment() {
    _count++; // Increase the counter.
    notifyListeners(); // Notify all listening widgets to rebuild.
  }
}

void main() {
  runApp(
    // ChangeNotifierProvider makes the Counter model available to the widget tree.
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            // Consumer listens to the Counter model and rebuilds when notifyListeners() is called.
            Consumer<Counter>(
              builder: (consumerCtx, counter, child) {
                return Text(
                  '${counter.count}', // Display the current count.
                  style: Theme.of(consumerCtx).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Using Provider.of with listen: false since we don't need a rebuild on button press.
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
