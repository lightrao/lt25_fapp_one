import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AwesomeNotifications().initialize(
    null, // default icon
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic tests',
        importance: NotificationImportance.High,
        defaultColor: Colors.blue,
        ledColor: Colors.white,
      )
    ],
  );

  requestPermission();

  runApp(const MyApp());
}

void requestPermission() async {
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Notification Demo')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Show Notification'),
            onPressed: () async {
              await AwesomeNotifications().createNotification(
                content: NotificationContent(
                  id: 1,
                  channelKey: 'basic_channel',
                  title: 'Hello World!',
                  body: 'This is your first notification',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
