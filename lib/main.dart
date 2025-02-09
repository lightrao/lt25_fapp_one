import 'package:flutter_background/flutter_background.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isBackgroundEnabled = false;

  Future<void> _toggleBackground() async {
    await BackgroundService.initialize();
    final success = await BackgroundService.toggleBackground();
    if (!success) {
      print('Failed to toggle background execution.');
      return;
    }
    // Update the state using the current value.
    setState(() {
      isBackgroundEnabled = FlutterBackground.isBackgroundExecutionEnabled;
      print('Background execution: $isBackgroundEnabled');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: _toggleBackground,
            child: Text(
                isBackgroundEnabled ? 'Stop Background' : 'Start Background'),
          ),
        ),
      ),
    );
  }
}

class BackgroundService {
  static final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "Background Service",
    notificationText: "Running in background",
    notificationImportance: AndroidNotificationImportance.high,
    notificationIcon: AndroidResource(name: 'ic_launcher', defType: 'mipmap'),
  );

  static Future<bool> initialize() async {
    return await FlutterBackground.initialize(androidConfig: androidConfig);
  }

  static Future<bool> toggleBackground() async {
    if (await FlutterBackground.hasPermissions) {
      if (FlutterBackground.isBackgroundExecutionEnabled) {
        return await FlutterBackground.disableBackgroundExecution();
      } else {
        // Enable background execution.
        return await FlutterBackground.enableBackgroundExecution();
      }
    }
    return false;
  }
}
