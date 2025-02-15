import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class LiquidProgressExamples extends StatefulWidget {
  const LiquidProgressExamples({super.key});

  @override
  State<LiquidProgressExamples> createState() => _LiquidProgressExamplesState();
}

class _LiquidProgressExamplesState extends State<LiquidProgressExamples> {
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    // Simulate progress
    _startProgress();
  }

  void _startProgress() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _progress += 0.01;
        if (_progress < 1.0) {
          _startProgress();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Example 1: Circular Liquid Progress
        SizedBox(
          width: 200,
          height: 200,
          child: LiquidCircularProgressIndicator(
            value: _progress,
            backgroundColor: Colors.white,
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
            center: Text(
              '${(_progress * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        // Example 2: Linear Liquid Progress
        SizedBox(
          width: 200,
          height: 40,
          child: LiquidLinearProgressIndicator(
            value: _progress,
            backgroundColor: Colors.white,
            valueColor: const AlwaysStoppedAnimation(Colors.green),
            borderRadius: 12,
            center: Text(
              '${(_progress * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
