import 'package:fitplan/repositories/workout/database.dart';
import 'package:drift/drift.dart';

class ExerciseRepeatRepository {
  final AppDatabase database;

  ExerciseRepeatRepository({required this.database});

  Future<void> addExerciseRepeat(ExerciseRepeatsCompanion repeat) async {
    await database.into(database.exerciseRepeats).insert(repeat);
  }

  Future<void> addExerciseRepeats(List<ExerciseRepeatsCompanion> repeats) async {
    await database.batch((batch) {
      batch.insertAll(database.exerciseRepeats, repeats, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> deleteExerciseRepeat(String id) async {
    await (database.delete(database.exerciseRepeats)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Future<List<ExerciseRepeat>> getExerciseRepeatsByDate(DateTime date) async {
    return await (database.select(database.exerciseRepeats)
          ..where((tbl) => tbl.date.equals(date)))
        .get();
  }

  Future<List<ExerciseRepeat>> getExerciseRepeatsByWorkout(String workoutId) async {
    return await (database.select(database.exerciseRepeats)
          ..where((tbl) => tbl.workoutId.equals(workoutId)))
        .get();
  }
}
