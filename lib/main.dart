import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProgressScreen(),
    );
  }
}

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double _progress = 0.0;

  void _increaseProgress() {
    setState(() {
      _progress += 0.1;
      if (_progress > 1.0) _progress = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percent Indicator Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Progress Indicator
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 20.0,
              percent: _progress,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                '${(_progress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 20.0),
              ),
            ),

            const SizedBox(height: 30),

            // Linear Progress Indicator
            SizedBox(
              width: 200.0,
              child: LinearPercentIndicator(
                lineHeight: 18.0,
                percent: _progress,
                backgroundColor: Colors.grey,
                progressColor: Colors.green,
                barRadius: const Radius.circular(10),
                padding: EdgeInsets.zero,
                center: Text('${(_progress * 100).toStringAsFixed(0)}%'),
              ),
            ),

            const SizedBox(height: 30),

            // Update Button
            ElevatedButton(
              onPressed: _increaseProgress,
              child: const Text('Add 10% Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
