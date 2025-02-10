// main.dart
import 'package:flutter/material.dart';
import 'locator.dart'; // Import your locator setup
import 'my_home_page.dart'; // Import your MyHomePage widget

void main() {
  setupLocator(); // Set up the central kitchen before the restaurant opens!
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetIt Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GetIt Counter App'),
    );
  }
}
