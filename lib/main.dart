// main.dart (The Photo Album Workshop)
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyCalendarAlbum());

class MyCalendarAlbum extends StatefulWidget {
  const MyCalendarAlbum({super.key});

  @override
  _MyCalendarAlbumState createState() => _MyCalendarAlbumState();
}

class _MyCalendarAlbumState extends State<MyCalendarAlbum> {
  // Our calendar's current focal point (like a camera lens)
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay; // Currently chosen photo frame
  final Map<DateTime, List<String>> _events = {
    DateTime(2025, 2, 13): ['Event 1', 'Event 2'],
    DateTime(2025, 2, 14): ['Event 3'],
  }; // Event stickers collection

  // Helper method to get events matching a day
  List<String> _getEventsForDay(DateTime day) {
    final events = _events.entries
        .where((entry) => isSameDay(entry.key, day))
        .map((entry) => entry.value)
        .expand((element) => element)
        .toList();
    print('Loading events for $day: $events');
    return events;
  }

  @override
  Widget build(BuildContext context) {
    final eventsForSelectedDay = _selectedDay != null
        ? _getEventsForDay(_selectedDay!)
        : _getEventsForDay(_focusedDay);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Memory Calendar Album')),
        body: Column(
          children: [
            // The Album Spread
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1), // First page
              lastDay: DateTime.utc(2030, 12, 31), // Last page
              focusedDay: _focusedDay, // Current visible page

              // Decorate individual photo frames
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
              ),

              // Handle page turns and frame selections
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  _selectedDay = focusedDay;
                });
              },
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },

              // Add event stickers
              eventLoader: _getEventsForDay,
            ),

            // Event Sticker Drawer
            Expanded(
              child: ListView.builder(
                itemCount: eventsForSelectedDay.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(eventsForSelectedDay[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
