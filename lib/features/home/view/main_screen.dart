import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<String> _events = []; // This will hold the events for the selected day

  @override
  void initState() {
    super.initState();
    // Initialize events for the current day
    _events = [];
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FitPlan"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.of(context).pushNamed("/settings");
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            headerVisible: false,
            calendarFormat: _calendarFormat,
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              selectedTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              todayTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              todayDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.rectangle,
              ),
              defaultTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                // Update the list of events based on the selected day
                log(_selectedDay.toString());
                _events = _getEventsForDay(selectedDay);
              });
            },
          ),
        ),
      ),
      body: SafeArea(
        child: _events.isEmpty
            ? const Center(
                // child: Image.asset(
                //   'assets/empty_list.png', // Replace with your image asset
                //   fit: BoxFit.cover,
                // ),
                child: Icon(
                  Icons.thumb_down_off_alt,
                  color: Colors.amber,
                  size: 100,
                ),
              )
            : ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_events[index]),
                  );
                },
              ),
      ),
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    return ['Sample Event for Today', 'Sample Event for Today'];
  }
}
