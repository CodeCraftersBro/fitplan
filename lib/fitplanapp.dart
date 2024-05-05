import 'package:fitplan/bloc/theme/theme_cubit.dart';
import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/repositories/settings/settings.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:fitplan/router/router.dart';
import 'package:fitplan/ui/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FitPlanApp extends StatefulWidget {
  const FitPlanApp({super.key, required this.preferences});

  final SharedPreferences preferences;

  @override
  State<FitPlanApp> createState() => _FitPlanAppState();
}

class _FitPlanAppState extends State<FitPlanApp> {
  @override
  Widget build(BuildContext context) {
    final settingsRepository =
        SettingsRepository(preferences: widget.preferences);
    final workoutRepository = WorkoutRepository();

    

    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => WorkoutCalendarDataBloc(workoutRepository)),
        BlocProvider(
            create: (context) =>
                ThemeCubit(settingsRepository: settingsRepository)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: "FitPlan",
            debugShowCheckedModeBanner: false,
            theme: state.isDark ? themeDark : themeLight,
            routes: routes,
          );
        },
      ),
    );
  }
}
