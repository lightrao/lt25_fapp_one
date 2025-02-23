import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TickerExample(),
    );
  }
}

class TickerExample extends StatefulWidget {
  @override
  _TickerExampleState createState() => _TickerExampleState();
}

class _TickerExampleState extends State<TickerExample>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double _elapsedSeconds = 0.0;

  @override
  void initState() {
    super.initState();
    // Create and start the ticker with a callback that updates the elapsed time.
    _ticker = this.createTicker(_onTick);
    _ticker.start();
  }

  // This callback is called every frame with the elapsed time since the ticker started.
  void _onTick(Duration elapsed) {
    setState(() {
      _elapsedSeconds = elapsed.inMilliseconds / 1000.0;
    });
  }

  @override
  void dispose() {
    // Dispose the ticker when the widget is disposed to free resources.
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticker Example"),
      ),
      body: Center(
        child: Text(
          "Elapsed time: ${_elapsedSeconds.toStringAsFixed(2)} seconds",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
