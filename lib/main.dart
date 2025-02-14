import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

/// MyApp is the root widget of our application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rive Animation Example',
      home: const RiveHomePage(),
    );
  }
}

/// RiveHomePage displays the Rive animation in the center of the screen.
class RiveHomePage extends StatelessWidget {
  const RiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rive Demo')),
      body: Center(
        child: RiveAnimation.asset(
          'assets/scrollbar.riv', // Path to your .riv file
          fit: BoxFit.contain, // Adjusts the animation to the available space
          // Optionally, you can control the animation playback:
          // controllers: [SimpleAnimation('AnimationName')],
        ),
      ),
    );
  }
}
