import 'package:flutter/material.dart';
import 'package:cron/cron.dart';

void main() {
  // Start the Flutter app.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // A basic MaterialApp that uses CronExample as the home screen.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cron Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CronExample(),
    );
  }
}

class CronExample extends StatefulWidget {
  const CronExample({super.key});

  @override
  _CronExampleState createState() => _CronExampleState();
}

class _CronExampleState extends State<CronExample> {
  // Create an instance of Cron to schedule jobs.
  final Cron cron = Cron();
  // List to store messages from our cron job.
  List<String> logMessages = [];

  @override
  void initState() {
    super.initState();
    // Schedule a job that runs every 3 seconds.
    // The cron expression '*/3 * * * * *' means: every 3 seconds.
    cron.schedule(Schedule.parse('*/3 * * * * *'), () {
      // Get the current time.
      String now = DateTime.now().toLocal().toString();
      print("Cron Job fired at: $now");
      // Update the UI by adding a new log message.
      setState(() {
        logMessages.add("Cron Job fired at: $now");
      });
    });
  }

  @override
  void dispose() {
    // It is important to close the cron instance to cancel scheduled jobs
    // and free resources when the widget is disposed.
    cron.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // A simple Scaffold that displays our log messages in a list.
    return Scaffold(
      appBar: AppBar(
        title: Text('Cron Example'),
      ),
      body: ListView.builder(
        itemCount: logMessages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(logMessages[index]),
          );
        },
      ),
    );
  }
}
