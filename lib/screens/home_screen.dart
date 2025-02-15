import 'package:flutter/material.dart';
import '../widgets/liquid_progress_examples.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liquid Progress Demo'),
      ),
      body: const Center(
        child: LiquidProgressExamples(),
      ),
    );
  }
}
