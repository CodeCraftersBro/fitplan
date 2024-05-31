import 'dart:async';

import 'package:fitplan/fitplanapp.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repositories/workout/models/models.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();

    final config = Configuration.local([
      Workout.schema,
      Exercise.schema,
      ExerciseType.schema,
    ]);
    final realm = Realm(config);
    

    runApp(FitPlanApp(
      preferences: preferences,
      realm:realm,
    ));
  }, (error, stack) {});
}
