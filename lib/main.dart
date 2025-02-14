import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // The root widget of the app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just Audio Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  // Create an instance of AudioPlayer.
  final AudioPlayer _player = AudioPlayer();
  // A sample audio URL (you can use any valid URL).
  final String audioUrl = 'assets/bell_indian.ogg';

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Load the audio source when the widget initializes.
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      // Load the local asset using setAsset.
      await _player.setAsset(audioUrl);
    } catch (e) {
      debugPrint('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    // Always dispose of the player to free resources.
    _player.dispose();
    super.dispose();
  }

  // Toggles between playing and pausing.
  void _togglePlayPause() {
    if (isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Just Audio Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tap the button to play/pause the audio:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            IconButton(
              iconSize: 64,
              icon: Icon(isPlaying
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_filled),
              onPressed: _togglePlayPause,
            ),
          ],
        ),
      ),
    );
  }
}
