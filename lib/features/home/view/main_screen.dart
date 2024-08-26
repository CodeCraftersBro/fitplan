import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/features/search/bloc/exercise_search_bloc.dart';
import 'package:fitplan/features/workout/workout.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/features/search/search.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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

  String _getAppBarTitle() {
    final now = DateTime.now();
    if (_selectedDay.year == now.year &&
        _selectedDay.month == now.month &&
        _selectedDay.day == now.day) {
      return S.of(context).today;
    } else {
      return DateFormat('dd MMMM yyyy').format(_selectedDay);
    }
  }

  void _showModalAddExercise(BuildContext context, DateTime selectedDate) async {
    final bloc = context.read<ExerciseSearchBloc>();
    bloc.add(FetchInitialData());

    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) =>  SearchScreen(selectedDate: selectedDate),
    );
  }

 void _showModalListExercise(BuildContext context, DateTime selectedDate) async {
   
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) =>  const WorkoutScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<ExerciseSearchBloc, ExerciseSearchState>(
      listener: (context, state) {
        if (state is ExerciseSearchLoaded) {
          context
              .read<WorkoutCalendarDataBloc>()
              .add(LoadWorkoutCalendarData(selectedDate: _selectedDay));
        }
      },
      child: BlocBuilder<WorkoutCalendarDataBloc, WorkoutCalendarDataState>(
        builder: (context, state) {
          List<Workout> workouts = [];

          if (state is WorkoutCalendarDataLoaded) {
            workouts = state.workouts;
          }

          return Scaffold(
            floatingActionButton:
                BlocBuilder<WorkoutCalendarDataBloc, WorkoutCalendarDataState>(
              builder: (context, state) {
                List<Workout> workouts = [];

                if (state is WorkoutCalendarDataLoaded) {
                  workouts = state.workouts;
                }

                if (workouts.isNotEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       FloatingActionButton(
                        heroTag: 'fab1',
                        child: Icon(Icons.edit),
                        onPressed: () {
                          _showModalListExercise(context,_selectedDay);
                        },
                      ),
                      FloatingActionButton.extended(
                        heroTag: 'fab2',
                        label: Text(
                          S.of(context).addExercise,
                          style: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          _showModalAddExercise(context,_selectedDay);
                        },
                      ),
                    ],
                  );
                } else {
                  return FloatingActionButton.extended(
                    label: const Text(
                      "Добавить упражнение",
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      _showModalAddExercise(context,_selectedDay);
                    },
                  );
                }
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
              title: Text(_getAppBarTitle()),
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
                    selectedTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                    todayTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                    todayDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
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
                            case "down": // LineDirection.down:
                              // lineIndicator = buildDashedLineIndicator(
                              //     36);
                              lineIndicator = buildDashedLineIndicator(
                                LineDirection.down,
                                70,
                                context,
                              ); // Высота от центра вниз
                              break;
                            case 'up': //LineDirection.up:
                              lineIndicator = buildDashedLineIndicator(
                                LineDirection.up,
                                70,
                                context,
                              );
                              break;
                            case "middle": //LineDirection.middle:
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

                          // var exercise = context.read<ExerciseRepository>().getExerciseById(workouts[index].exerciseId);
                          // print(exercise.name);
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
                                        ],
                                      )
                                    : const SizedBox(
                                        width: 0,
                                        height: 72,
                                      ),
                                if (workouts[index].isSet)
                                  const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (workouts[index].isSet)
                                          ? Theme.of(context)
                                              .colorScheme
                                              .surface //Colors.amber
                                          : Theme.of(context)
                                              .colorScheme
                                              .surface,
                                    ),
                                    child: WorkoutItemWidget(
                                        workout: workouts[index]),
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
      ),
    );
  }
}

class WorkoutItemWidget extends StatelessWidget {
  final Workout workout;

  const WorkoutItemWidget({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Exercise?>(
      future: context
          .read<ExerciseRepository>()
          .getExerciseById(workout.exerciseId),
      builder: (context, snapshot) {
        print("object");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData && snapshot.data != null) {
          final exercise = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    ExcerseTypeIconWidget(
                        exerciseTypeId: exercise.exerciseTypeId),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exercise.name, //workouts[index].isSet.toString(),
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                        Text(
                          S.of(context).ringWorkout(
                            10
                          ),
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.data_saver_on,
                          color: Theme.of(context).colorScheme.primary,
                        ))
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Text('Exercise not found');
        }
      },
    );
  }
}

class ExcerseTypeIconWidget extends StatelessWidget {
  final String exerciseTypeId;

  const ExcerseTypeIconWidget({super.key, required this.exerciseTypeId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExerciseType?>(
      future: context
          .read<ExerciseTypeRepository>()
          .getExerciseTypeById(exerciseTypeId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Показать индикатор загрузки
        } else if (snapshot.hasError) {
          return Text('Ошибка: ${snapshot.error}'); // Показать ошибку
        } else if (snapshot.hasData && snapshot.data != null) {
          final exerciseType = snapshot.data!;
          return Text(
            exerciseType.icon,
            style: const TextStyle(
              fontSize: 40,
            ),
          );
        } else {
          return const Text(
            '❓', // Показать иконку вопроса, если категория не найдена
            style: TextStyle(
              fontSize: 40,
            ),
          );
        }
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
