import 'dart:async';

import 'package:fitplan/fitplanapp.dart';
import 'package:fitplan/repositories/search/search.dart';
import 'package:fitplan/repositories/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();

    final config = Configuration.local(
      [
        Workout.schema,
        Exercise.schema,
        ExerciseType.schema,
      ],
      schemaVersion: 3,
      migrationCallback: (migration, oldSchemaVersion) {
        if (oldSchemaVersion < 2) {
          // Здесь можно выполнить действия по миграции, если они необходимы
          // Например, если требуется изменить данные, можно написать логику здесь
        }
      },
    );
    final realm = Realm(config);

    runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => WorkoutRepository(realm: realm),
        ),
        RepositoryProvider(
          create: (context) => SettingsRepository(preferences: preferences),
        ),
        RepositoryProvider(
          create: (context) => SearchRepository(realm: realm),
        ),
        RepositoryProvider(
          create: (context) => ExerciseRepository(realm: realm),
        ),
        RepositoryProvider(
          create: (context) => ExerciseTypeRepository(realm: realm),
        ),
      ],
      child: const FitPlanApp(
          // preferences: preferences,
          // realm: realm,
          ),
    ));
  }, (error, stack) {});
}
