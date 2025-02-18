import 'package:fitplan/bloc/app_version/app_version_cubit.dart';
import 'package:fitplan/bloc/theme/theme_cubit.dart';
import 'package:fitplan/features/perform/bloc/exercise_repeat_bloc.dart';
import 'package:fitplan/features/search/bloc/exercise_search_bloc.dart';
import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/features/workout/bloc/workout_editor_bloc.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/repositories/search/search_repository.dart';
import 'package:fitplan/repositories/settings/settings.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:fitplan/router/router.dart';
import 'package:fitplan/ui/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


// import 'repositories/workout/models/models.dart';
// import 'package:uuid/uuid.dart' as uuid_lib;

class FitPlanApp extends StatefulWidget {
  const FitPlanApp({super.key});

  @override
  State<FitPlanApp> createState() => _FitPlanAppState();
}

class _FitPlanAppState extends State<FitPlanApp> {
  // late final WorkoutRepository workoutRepository;
  // late final SettingsRepository settingsRepository;
  // late final SearchRepository searchRepository;

  // final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    // workoutRepository = WorkoutRepository(realm: widget.realm);

    // settingsRepository =
    //     SettingsRepository(preferences: widget.preferences);

    // searchRepository = SearchRepository(realm: widget.realm);

    // Получение списка тренировок и вывод в консоль

    _initEventWorkouts();
  }

  Future<void> _initEventWorkouts() async {


    if (!mounted) return;

    // Проверяем, есть ли уже упражнения в ExerciseTypeRepository
    final exerciseTypes = await context.read<ExerciseTypeRepository>().getExerciseTypes();
    if (exerciseTypes.isEmpty) {
        await context.read<ExerciseTypeRepository>().updateExerciseTypesFromAPI();
        if (!mounted) return;
    }

    // Проверяем, есть ли уже упражнения в ExerciseRepository
    final exercises = await context.read<ExerciseRepository>().getExercises();
    if (exercises.isEmpty) {
        await context.read<ExerciseRepository>().updateExercise();
        if (!mounted) return;
    }
    
    // await context.read<WorkoutRepository>().deleteAllWorkouts();
    // if (!mounted) return;
    // await context.read<ExerciseTypeRepository>().deleteAll();
    // if (!mounted) return;
    // await context.read<ExerciseTypeRepository>().updateExerciseTypesFromAPI();
    // if (!mounted) return;
    // await context.read<ExerciseRepository>().deleteAllExercise();
    // if (!mounted) return;
    // await context.read<ExerciseRepository>().updateExercise();
    // final exercises = await context.read<ExerciseRepository>().getExercises();
    // final date = _getDateWithoutTime(DateTime.now());

    // var uuid = const uuid_lib.Uuid();
    // for (var exercise in exercises) {
    //   int sortOrder =
    //       await context.read<WorkoutRepository>().getNextSortOrderForDate(date);
    //   if (exercise.exerciseTypeId == '1') {
    //     var workout = Workout(
    //       uuid.v4(),
    //       sortOrder, //сортировка
    //       date,
    //       true,
    //       0,
    //       'middle', //индикатор
    //       exercise.id,
    //     );
    //     if (!mounted) return;
    //     await context.read<WorkoutRepository>().addWorkout(workout);
    //   }
    //   if (exercise.exerciseTypeId == '4') {
    //     var workout = Workout(
    //       uuid.v4(),
    //       sortOrder, //сортировка
    //       date,
    //       false,
    //       0,
    //       '', //индикатор
    //       exercise.id,
    //     );
    //     if (!mounted) return;
    //     await context.read<WorkoutRepository>().addWorkout(workout);
    //   }
    //   print('Exercise: ${exercise.name}, ID: ${exercise.id}');
    // }
  }

  DateTime _getDateWithoutTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  @override
  Widget build(BuildContext context) {
    return FitPlanScope(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          // final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

          // if (isIOS) {
          // return CupertinoApp(
          //     title: "FitPlan",
          //     debugShowCheckedModeBanner: false,
          //     localizationsDelegates: const [
          //       S.delegate,
          //       GlobalMaterialLocalizations.delegate,
          //       GlobalWidgetsLocalizations.delegate,
          //       GlobalCupertinoLocalizations.delegate,
          //     ],
          //     supportedLocales: S.delegate.supportedLocales,
          //     theme: state.isDark
          //         ? cupertinoThemeDark
          //         : cupertinoThemeLight,
          //     routes: routes); //routes.map((key, value) => MapEntry(
          //         key,
          //         (context) => CupertinoPageScaffold(
          //           navigationBar: CupertinoNavigationBar(
          //             middle: Text(key),
          //           ),
          //           child: value(context),
          //         ),
          //       )),
          // );
          // } else {
          return MaterialApp(
            title: "FitPlan",
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            // locale: const Locale('ru'),
            supportedLocales: S.delegate.supportedLocales,
            theme: state.isDark ? themeDark : themeLight,
            routes: routes,
          );
          // }
        },
      ),
    );
  }
}

class FitPlanScope extends StatelessWidget {
  const FitPlanScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkoutCalendarDataBloc(
              context.read<WorkoutRepository>(),
              context.read<ExerciseRepository>(),
              context.read<ExerciseTypeRepository>(),
              context.read<ExerciseRepeatRepository>()
              ),
        ),
        BlocProvider(
          create: (context) =>
              WorkoutEditorBloc(context.read<WorkoutRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              ExerciseRepeatBloc(
                exerciseRepeatRepository: context.read<ExerciseRepeatRepository>()
              ),
        ),
        
        // BlocProvider(
        //   create: (context) => ExerciseSearchBloc(
        //     exerciseTypeRepository: exerciseTypeRepository,
        //     exerciseRepository: exerciseRepository,
        //   ),
        // ),
        BlocProvider(
          create: (context) {
            final bloc = ExerciseSearchBloc(
              searchRepository: context.read<SearchRepository>(),
            );
            bloc.add(FetchInitialData());
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) => ThemeCubit(
              settingsRepository: context.read<SettingsRepository>()),
        ),
        BlocProvider(
          create: (context) => AppVersionCubit(),
        ),
      ],
      child: child,
    );
  }
}
