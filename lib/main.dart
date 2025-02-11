import 'dart:async';
import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Hold the current volume value (range 0.0 to 1.0)
  double _currentVolume = 0.5;
  late final VolumeController _volumeController;
  late final StreamSubscription<double> _volumeSubscription;

  @override
  void initState() {
    super.initState();
    // Get the singleton instance
    _volumeController = VolumeController.instance;

    // Set up the listener that updates volume changes from the system
    _volumeSubscription = _volumeController.addListener((volume) {
      setState(() => _currentVolume = volume);
    },
        fetchInitialVolume:
            true); // fetchInitialVolume gets the current volume immediately

    // Optional: Initialize volume if you want to start with a specific level
    _volumeController.setVolume(_currentVolume);
  }

  @override
  void dispose() {
    _volumeSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The UI shows a slider representing the current volume,
    // much like the faucet handle controlling the water flow.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Volume Controller Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Current Volume: ${(_currentVolume * 100).round()}%'),
              const SizedBox(height: 20),
              Slider(
                value: _currentVolume,
                min: 0,
                max: 1,
                divisions: 100,
                label: (_currentVolume * 100).round().toString(),
                onChanged: (double value) async {
                  // When you slide, it sets the system volume,
                  // like turning the faucet handle to adjust water flow.
                  setState(() => _currentVolume = value);
                  await _volumeController.setVolume(value);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Toggle mute: if volume is > 0 then mute, else restore volume
                  bool isMuted = await _volumeController.isMuted();
                  await _volumeController.setMute(!isMuted);
                },
                child: const Text('Toggle Mute'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
