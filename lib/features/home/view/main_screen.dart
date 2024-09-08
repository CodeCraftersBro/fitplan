import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/features/home/widgets/widgets.dart';
import 'package:fitplan/features/search/bloc/exercise_search_bloc.dart';
import 'package:fitplan/features/workout/bloc/workout_editor_bloc.dart';
import 'package:fitplan/features/workout/workout.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/repositories/workout/entity/entity.dart';
import 'package:fitplan/features/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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

  @override
  void initState() {
    super.initState();
   
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

  void _showModalAddExercise(
      BuildContext context, DateTime selectedDate) async {
    final bloc = context.read<ExerciseSearchBloc>();
    bloc.add(FetchInitialData());

    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => SearchScreen(selectedDate: selectedDate),
    );
  }

  void _showModalListExercise(
      BuildContext context, DateTime selectedDate,List<WorkoutOverview> workoutOverviewList) async {
    
    final workoutOverviewReorderableList = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => WorkoutScreen(selectedDate: selectedDate, workoutOverviewList: workoutOverviewList),
    );
    if (workoutOverviewReorderableList == null) {
      return;
    }
    if (!mounted) return;

    context.read<WorkoutEditorBloc>().add(UpdateWorkoutDate(selectedDate,workoutOverviewReorderableList));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ExerciseSearchBloc, ExerciseSearchState>(
          listener: (context, state) {
            if (state is ExerciseSearchLoaded) {
              context
                  .read<WorkoutCalendarDataBloc>()
                  .add(LoadWorkoutCalendarData(selectedDate: _selectedDay));
            }
          },
        ),
        BlocListener<WorkoutEditorBloc, WorkoutEditorState>(
          listener: (context, state) {

            if (state is WorkoutEditorLoaded) {
              context
                  .read<WorkoutCalendarDataBloc>()
                  .add(LoadWorkoutCalendarData(selectedDate: _selectedDay));
            }
          },
        ),
      ],
      child: BlocBuilder<WorkoutCalendarDataBloc, WorkoutCalendarDataState>(
        builder: (context, state) {
          List<WorkoutOverview> workoutOverviewList= [];

          if (state is WorkoutCalendarLoaded) {
            workoutOverviewList = state.workoutList;
          }

          return Scaffold(
            floatingActionButton:
                BlocBuilder<WorkoutCalendarDataBloc, WorkoutCalendarDataState>(
              builder: (context, state) {

                if (workoutOverviewList.isNotEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        heroTag: 'editor',
                        child: const Icon(Icons.move_up),
                        onPressed: () {
                          _showModalListExercise(context, _selectedDay,workoutOverviewList);
                        },
                      ),
                      FloatingActionButton.extended(
                        heroTag: 'add',
                        label: Text(
                          S.of(context).addExercise,
                          style: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          _showModalAddExercise(context, _selectedDay);
                        },
                      ),
                    ],
                  );
                } else {
                  return FloatingActionButton.extended(
                    label: Text(
                      S.of(context).addExercise,
                      style: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      _showModalAddExercise(context, _selectedDay);
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
              child: state is WorkoutCalendarFailure || workoutOverviewList.isEmpty
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
                        itemCount: workoutOverviewList.length,
                        itemBuilder: (context, index) {
                          Widget lineIndicator;

                          switch (workoutOverviewList[index].workoutExerciseIndicator) {
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
                                (workoutOverviewList[index].workoutIsSet)
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
                                if (workoutOverviewList[index].workoutIsSet)
                                  const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (workoutOverviewList[index].workoutIsSet)
                                          ? Theme.of(context)
                                              .colorScheme
                                              .surface //Colors.amber
                                          : Theme.of(context)
                                              .colorScheme
                                              .surface,
                                    ),
                                    child: WorkoutItemWidget(workoutOverview: workoutOverviewList[index]),
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
