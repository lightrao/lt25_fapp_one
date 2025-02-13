import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  // Set a default locale (optional – you can also let the system locale decide)
  Intl.defaultLocale = 'en_US';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intl Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example 1: Format the current date.
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMMd().format(now);
    // Think of it as our chef preparing today’s date in the local style.

    // Example 2: Format a number as currency.
    double amount = 1234567.89;
    String formattedCurrency =
        NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(amount);
    // Here, our chef dresses up the number in a “currency costume.”

    // Example 3: Use a localizable message.
    // In a real app, you’d extract messages using intl tools.
    String greeting = Intl.message(
      'Hello, World!',
      name: 'greeting',
      desc: 'Simple greeting message',
    );
    // Our chef even serves up a friendly greeting!

    return Scaffold(
      appBar: AppBar(
        title: const Text('Intl Package Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Current date: $formattedDate',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text('Formatted amount: $formattedCurrency',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text(greeting, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
