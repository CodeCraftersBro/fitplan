import 'dart:developer';

import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<Workout> _workouts = []; // This will hold the workouts for the selected day

  @override
  void initState() {
    super.initState();
    // Initialize workouts for the current day
    _workouts = [];
    context
        .read<WorkoutCalendarDataBloc>()
        .add(LoadWorkoutCalendarData(selectedDate: _selectedDay));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCalendarDataBloc, WorkoutCalendarDataState>(
      builder: (context, state) {
        if (state is WorkoutCalendarDataLoaded) {
          _workouts = state.workouts;
        }

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
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.onBackground),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    context
                        .read<WorkoutCalendarDataBloc>()
                        .add(LoadWorkoutCalendarData(selectedDate: _selectedDay));
                  });
                },
              ),
            ),
          ),
          body: SafeArea(
            child: _workouts.isEmpty
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
                    itemCount: _workouts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_workouts[index].exercise.name),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}