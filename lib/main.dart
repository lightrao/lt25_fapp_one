import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'screens/settings_screen.dart';

void main() async {
  // Ensure binding and initialize settings before runApp
  WidgetsFlutterBinding.ensureInitialized();
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Settings Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SettingsScreenPage(),
    );
  }
}
