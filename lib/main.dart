import 'package:flutter/material.dart';
import 'views/counter_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC in Flutter Demo',
      home: CounterView(),
    );
  }
}
