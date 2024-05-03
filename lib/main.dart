import 'dart:async';

import 'package:fitplan/fitplanapp.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();




    final ExerciseTypeRepositoryInterface repository = ExerciseTypeRepository();

  // Initially, use local data.
  print(await repository.getExerciseTypes());

  // Later, update from API and print the updated list.
  await repository.updateExerciseTypesFromAPI();
  print(await repository.getExerciseTypes());




    runApp(FitPlanApp(
      preferences: preferences,
    ));
  }, (error, stack) {});
}
