import 'package:flutter/material.dart';
import 'package:do_not_disturb/do_not_disturb.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dndPlugin = DoNotDisturbPlugin();
  bool _isDndEnabled = false;
  String _status = 'Unknown';

  Future<void> _checkStatus() async {
    final bool enabled = await _dndPlugin.isDndEnabled();
    final InterruptionFilter filter = await _dndPlugin.getDNDStatus();

    setState(() {
      _isDndEnabled = enabled;
      _status = filter.toString().split('.').last;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DND Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _checkStatus,
                child: const Text('Check DND Status'),
              ),
              const SizedBox(height: 20),
              Text('DND Enabled: $_isDndEnabled'),
              Text('Current Status: $_status'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _dndPlugin.openDndSettings(),
                child: const Text('Open DND Settings'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (await _dndPlugin.isNotificationPolicyAccessGranted()) {
                    await _dndPlugin.setInterruptionFilter(_isDndEnabled
                        ? InterruptionFilter.all
                        : InterruptionFilter.none);
                    _checkStatus();
                  } else {
                    await _dndPlugin.openNotificationPolicyAccessSettings();
                  }
                },
                child: const Text('Toggle DND'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
