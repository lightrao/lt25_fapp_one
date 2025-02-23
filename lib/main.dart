import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrivialAnimationExample(),
    );
  }
}

class TrivialAnimationExample extends StatefulWidget {
  const TrivialAnimationExample({super.key});

  @override
  _TrivialAnimationExampleState createState() =>
      _TrivialAnimationExampleState();
}

class _TrivialAnimationExampleState extends State<TrivialAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Create an AnimationController with a duration of 2 seconds.
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    // Define a Tween animation that goes from 0 (fully transparent) to 1 (fully opaque).
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation to repeatedly animate back and forth.
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    // Dispose of the controller to release resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trivial Animation Example")),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            // Apply the animation value to the opacity of a blue container.
            return Opacity(
              opacity: _animation.value,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
              ),
            );
          },
        ),
      ),
    );
  }
}
