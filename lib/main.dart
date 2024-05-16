import 'dart:async';

import 'package:fitplan/fitplanapp.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
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

  final exerciseType = await repository.getExerciseTypeById('4');
  print(exerciseType); 


ExerciseRepository repositoryEx = ExerciseRepository();

// Получить список упражнений
repositoryEx.getExercises().then((exercises) {
  print(exercises);
});

// Получить упражнение по ID
repositoryEx.getExerciseById('2').then((exercise) {
  if (exercise != null) {
    print(exercise.name);
  } else {
    print('Упражнение не найдено');
  }
});

// Добавить новое упражнение
// repositoryEx.addExercise(Exercise(id: '4', name: 'Выпады', typeId: ExerciseType(id: 'strength', name: 'Силовые', icon: '💪')));

// // Обновить упражнение
// repositoryEx.updateExercise(Exercise(id: '2', name: 'Приседания с гантелями', typeId: ExerciseType(id: 'strength', name: 'Силовые', icon: '💪')));
// repositoryEx.getExercises().then((exercises) {
//   print(exercises);
// });
// // Удалить упражнение
// repositoryEx.deleteExercise('1');




    runApp(FitPlanApp(
      preferences: preferences,
    ));
  }, (error, stack) {});
}
