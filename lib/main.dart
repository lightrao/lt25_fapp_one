import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibration Example',
      home: VibrationHome(),
    );
  }
}

class VibrationHome extends StatelessWidget {
  const VibrationHome({super.key});

  // Function to trigger device vibration
  Future<void> _vibrateDevice() async {
    // Check if the device supports vibration
    if (await Vibration.hasVibrator()) {
      // Vibrate for 500 milliseconds
      Vibration.vibrate(duration: 500);
      print("Device is vibrating.");
    } else {
      // If device does not support vibration, print a message to the console
      print("Device does not support vibration.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vibration Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _vibrateDevice,
          child: Text('Vibrate Device'),
        ),
      ),
    );
  }
}
