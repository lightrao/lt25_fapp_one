// main.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'event_bus_instance.dart';
import 'counter_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Bus Example',
      home: CounterHomePage(),
    );
  }
}

class CounterHomePage extends StatefulWidget {
  const CounterHomePage({super.key});

  @override
  _CounterHomePageState createState() => _CounterHomePageState();
}

class _CounterHomePageState extends State<CounterHomePage> {
  int _counterPublisher = 0;
  int _counterSubscriber = 0;
  // late var _subscription;
  late StreamSubscription<CounterEvent> _subscription;

  @override
  void initState() {
    super.initState();

    // Subscribe to events posted on the global event bus.
    _subscription = eventBus.on<CounterEvent>().listen((event) {
      // Update UI when a new event is received.
      setState(() {
        _counterSubscriber = event.count;
      });
    });
  }

  @override
  void dispose() {
    // Cancel the subscription when no longer needed to avoid memory leaks.
    _subscription.cancel();
    super.dispose();
  }

  // A method to "post" (publish) an event on the event bus.
  void _incrementCounter() {
    setState(() {
      _counterPublisher++;
    });
    // Publish a new event with the updated counter.
    eventBus.fire(CounterEvent(_counterPublisher));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Bus Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Publisher Counter:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counterPublisher',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 30),
            Text(
              'Subscriber Counter:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counterSubscriber',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
