import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'package:fitplan/repositories/workout/models/models.dart';

part 'database.g.dart'; // Подключение сгенерированного файла

@DriftDatabase(tables: [Exercises, ExerciseTypes, ExerciseRepeats, Workouts])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 5;
}

// Функция для открытия соединения с базой данных
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
