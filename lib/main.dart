import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Settings Example',
      home: const SettingsHomePage(),
    );
  }
}

class SettingsHomePage extends StatelessWidget {
  const SettingsHomePage({super.key});

  void _openSettings() {
    // This line opens the default app settings page.
    AppSettings.openAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Settings Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _openSettings,
          child: const Text('Open App Settings'),
        ),
      ),
    );
  }
}
