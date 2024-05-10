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
  // List<Workout> _workouts =
  //     []; // This will hold the workouts for the selected day

  @override
  void initState() {
    super.initState();
    // Initialize workouts for the current day
    // _workouts = [];
    context
        .read<WorkoutCalendarDataBloc>()
        .add(LoadWorkoutCalendarData(selectedDate: _selectedDay));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCalendarDataBloc, WorkoutCalendarDataState>(
      builder: (context, state) {
        List<Workout> workouts = [];

        if (state is WorkoutCalendarDataLoaded) {
          workouts = state.workouts;
        }
        print(workouts);
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
                  defaultTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    context.read<WorkoutCalendarDataBloc>().add(
                        LoadWorkoutCalendarData(selectedDate: _selectedDay));
                  });
                },
              ),
            ),
          ),
          body: SafeArea(
            child: state is WorkoutCalendarFailure || workouts.isEmpty
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
                    itemCount: workouts.length,
                    itemBuilder: (context, index) {
                      return ExerciseItemWidget(workout: workouts[index]);
                    },
                  ),
          ),
        );
      },
    );
  }
}

class ExerciseItemWidget extends StatelessWidget {
  const ExerciseItemWidget({
    super.key,
    required Workout workout,
  }) : _workout = workout;

  final Workout _workout;

  @override
  Widget build(BuildContext context) {
    // PreviousSetId != null && workout.setId == previousSetId ? Colors.blue : Colors.red,
    return ExpansionTile(
      leading: const SizedBox(
        width: 10,
        height: 10,
        child: CircleAvatar(
          backgroundColor: Colors.black,
        ),
      ),
      title: Row(
        children: [
          Text(_workout.setId?.toString() ?? '-'),
          Text(_workout.exercise.typeId.icon),
          const SizedBox(width: 16),
          Text(_workout.exercise.name),
        ],
      ),
      children: [
        ListView.builder(
          shrinkWrap: true, // Prevent excessive scrolling
          physics:
              const NeverScrollableScrollPhysics(), // Disable scrolling in sub-list
          itemCount: 3,
          itemBuilder: (context, stepIndex) {
            // final step = _workout.steps[stepIndex];
            return Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                title: Text("text"
                    // "Set ${stepIndex + 1}: Weight: ${step.weight}, Count: ${step.count}",
                    ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => _showStepDetailsBottomSheet(context),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _showStepDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Limit bottom sheet height
            children: [
              Text(
                "Set Details",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16.0),
              // Add additional details or actions here if needed
              ElevatedButton(
                onPressed: () {
                  // Handle button press, e.g., edit step details
                  Navigator.pop(context); // Close bottom sheet
                },
                child: const Text("Edit Set"),
              ),
            ],
          ),
        ));
      },
    );
  }
}
