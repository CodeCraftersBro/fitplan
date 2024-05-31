import 'package:fitplan/bloc/theme/theme_cubit.dart';
import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/repositories/settings/settings.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:fitplan/router/router.dart';
import 'package:fitplan/ui/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repositories/workout/models/models.dart';
import 'package:uuid/uuid.dart' as uuid_lib;


class FitPlanApp extends StatefulWidget {
  const FitPlanApp({super.key, required this.preferences, required this.realm});

  final SharedPreferences preferences;
  final Realm realm;

  @override
  State<FitPlanApp> createState() => _FitPlanAppState();
}


class _FitPlanAppState extends State<FitPlanApp> {

   late WorkoutRepository workoutRepository;
    // final _appRouter = AppRouter();

   @override
  void initState() {
    super.initState();
    workoutRepository = WorkoutRepository(realm: widget.realm);
    
    // Получение списка тренировок и вывод в консоль
    _printWorkouts();
  }
Future<void> _printWorkouts() async {


  await workoutRepository.deleteAllWorkouts();
  var uuid = uuid_lib.Uuid();

  final date = _getDateWithoutTime(DateTime.now());
    final exercise = Exercise(uuid.v4(), 'Push-up', '10');
    var  newWorkout = Workout(
      uuid.v4(),
      90,
       date,
    true,
      'down',
      exercise.id,
    );
    workoutRepository.addWorkout(newWorkout);
    newWorkout = Workout(
      uuid.v4(),
      0,
       date,
    true,
      'middle',
      exercise.id,
    );


workoutRepository.addWorkout(newWorkout);
newWorkout = Workout(
      uuid.v4(),
      0,
       date,
    true,
      'up',
      exercise.id,
    );


workoutRepository.addWorkout(newWorkout);
newWorkout = Workout(
      uuid.v4(),
      0,
       date,
    false,
      'up',
      exercise.id,
    );


workoutRepository.addWorkout(newWorkout);  
    // final date = DateTime.now();
    
    final workouts = await workoutRepository.getAllWorkouts();

    print('Workouts on $date:');
    for (var workout in workouts) {
      print('Workout ID: ${workout.id}');
    }
  }

DateTime _getDateWithoutTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
  
  @override
  Widget build(BuildContext context) {
    final settingsRepository =
        SettingsRepository(preferences: widget.preferences);

    


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkoutCalendarDataBloc(workoutRepository),
        ),
        BlocProvider(
          create: (context) =>
              ThemeCubit(settingsRepository: settingsRepository),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: "FitPlan",
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale("ru"),
            theme: state.isDark ? themeDark : themeLight,
            routes: routes,
          );
        },
      ),
    );
  }
}
