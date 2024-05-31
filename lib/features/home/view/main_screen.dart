import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

enum LineDirection { up, down, middle }

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

        return Scaffold(
          appBar: AppBar(
            title: const Text("settings"),
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
            // bottom: false,
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
                : Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
                      itemCount: workouts.length,
                      itemBuilder: (context, index) {
                        Widget lineIndicator;
                        switch (workouts[index].exerciseIndicator) {
                          case LineDirection.down:
                            // lineIndicator = buildDashedLineIndicator(
                            //     36);
                            lineIndicator = buildDashedLineIndicator(
                              LineDirection.down,
                              70,
                              context,
                            ); // Высота от центра вниз
                            break;
                          case LineDirection.up:
                            lineIndicator = buildDashedLineIndicator(
                              LineDirection.up,
                              70,
                              context,
                            );
                            break;
                          case LineDirection.middle:
                            lineIndicator = buildDashedLineIndicator(
                              LineDirection.middle,
                              70,
                              context,
                            );

                            break;
                          default:
                            lineIndicator =
                                const SizedBox(height: 72); // Нет линии
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (workouts[index].isSet)
                                  ? Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                          height: 72,
                                        ),
                                        lineIndicator,
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                width: 2),
                                          ),
                                        ),
                                        // Container(
                                        //   width: 10,
                                        //   height: 10,
                                        //   decoration: const BoxDecoration(
                                        //       shape: BoxShape.circle,
                                        //       color: Colors.black),
                                        // ),
                                      ],
                                    )
                                  : const SizedBox(
                                      width: 0,
                                      height: 72,
                                    ),
                              if (workouts[index].isSet) const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        (workouts[index].isSet)?
                                         Theme.of(context).colorScheme.surface//Colors.amber
                                        :Theme.of(context).colorScheme.surface,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              workouts[index].date.microsecond.toString(),
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              workouts[index].isSet.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontSize: 18,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Ring: ${workouts[index].sort}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium
                                                  ?.copyWith(
                                                    fontSize: 18,
                                                  ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon:  Icon(
                                                  Icons.data_saver_on,
                                                  color: Theme.of(context).colorScheme.primary,
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
        );
      },
    );
  }
}

// Использование DashedLinePainter для создания пунктирной линии
Widget buildDashedLineIndicator(
    LineDirection direction, double height, BuildContext context) {
  return CustomPaint(
    size: Size(0, height),
    painter: DashedLinePainter(
      direction: direction,
      height: height,
      lineColor: Theme.of(context).colorScheme.primary,
    ),
  );
}

// enum LineDirection { up, down, middle }
class DashedLinePainter extends CustomPainter {
  final LineDirection direction;
  final double height;
  final Color lineColor;
  DashedLinePainter({
    required this.direction,
    required this.height,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2;
    var dashWidth = 8.0;
    var dashSpace = 2.0;
    double startY = 0;

    // Определяем начальную и конечную точки в зависимости от направления
    switch (direction) {
      case LineDirection.up:
        startY = height / 2 + 4; //+2 fix
        while (startY >= 0) {
          canvas.drawLine(
              Offset(0, startY), Offset(0, startY - dashWidth), paint);
          startY -= (dashWidth + dashSpace);
        }
        break;
      case LineDirection.down:
        startY = height / 2 - 4; //-2 fix
        while (startY <= height) {
          canvas.drawLine(
              Offset(0, startY), Offset(0, startY + dashWidth), paint);
          startY += (dashWidth + dashSpace);
        }
        break;
      case LineDirection.middle:
        while (startY <= height) {
          canvas.drawLine(
              Offset(0, startY), Offset(0, startY + dashWidth), paint);
          startY += (dashWidth + dashSpace);
        }
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
