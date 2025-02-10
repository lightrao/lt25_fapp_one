// main.dart
import 'package:flutter/material.dart';
import 'service_locator.dart';
import 'package:get_it/get_it.dart';
import 'my_service.dart';

void main() {
  // Initialize and register all your services.
  setupLocator();

  // Run your app.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'get_it Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // Retrieve an instance of MyService using get_it.
  final MyService myService = GetIt.instance<MyService>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('get_it Example'),
      ),
      body: Center(
        child: Text(myService.getGreeting()),
      ),
    );
  }
}
