import 'dart:async';

import 'package:fitplan/fitplanapp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();

    runApp(FitPlanApp(
      preferences: preferences,
    ));
  }, (error, stack) {});
}
