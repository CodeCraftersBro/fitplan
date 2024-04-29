import 'dart:async';

import 'package:fitplan/fitplanapp.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const FitPlanApp());
  }, (error, stack) {});
}
