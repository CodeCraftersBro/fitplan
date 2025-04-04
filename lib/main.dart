import 'dart:async';

import 'package:fitplan/fitplanapp.dart';
import 'package:fitplan/repositories/search/search.dart';
import 'package:fitplan/repositories/settings/settings.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();

    final database = AppDatabase();

    await Purchases.setLogLevel(LogLevel.debug);

    await Purchases.configure(PurchasesConfiguration("appl_oLUPzzgMGVYEaOBjVROpmceEBkJ"));

    runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => WorkoutRepository(database: database),
        ),
        RepositoryProvider(
          create: (context) => SettingsRepository(preferences: preferences),
        ),
        RepositoryProvider(
          create: (context) => SearchRepository(database: database),
        ),
        RepositoryProvider(
          create: (context) => ExerciseRepository(database: database),
        ),
        RepositoryProvider(
          create: (context) => ExerciseTypeRepository(database: database),
        ),
        RepositoryProvider(
          create: (context) => ExerciseRepeatRepository(database: database),
        ),
      ],
      child: const FitPlanApp(),
    ));
  }, (error, stack) {});
}
