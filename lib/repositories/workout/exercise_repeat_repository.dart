import 'package:fitplan/repositories/workout/exercise_repeat_repository_interface.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:drift/drift.dart';

class ExerciseRepeatRepository implements ExerciseRepeatRepositoryInterface{
final AppDatabase database;

  ExerciseRepeatRepository({required this.database});

  @override
  Future<void> addExerciseRepeat(ExerciseRepeatsCompanion repeat) async {
    await database.into(database.exerciseRepeats).insert(repeat);
  }

  @override
  Future<void> addExerciseRepeats(List<ExerciseRepeatsCompanion> repeats) async {
    await database.batch((batch) {
      batch.insertAll(database.exerciseRepeats, repeats, mode: InsertMode.insertOrReplace);
    });
  }

  @override
  Future<void> updateExerciseRepeat(ExerciseRepeat repeat) async {
    await database.update(database.exerciseRepeats).replace(repeat);
  }

  Future<void> updateExerciseRepeatIds(String oldExerciseId, String newExerciseId) async {
    await (database.update(database.exerciseRepeats)
          ..where((tbl) => tbl.exerciseId.equals(oldExerciseId)))
        .write(ExerciseRepeatsCompanion(
          exerciseId: Value(newExerciseId),
        ));
  }



  @override
  Future<void> deleteExerciseRepeat(String id) async {
    await (database.delete(database.exerciseRepeats)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  @override
  Future<void> deleteExerciseRepeatsByWorkoutAndExercise(String workoutId, String exerciseId) async {
    await (database.delete(database.exerciseRepeats)
          ..where((tbl) => tbl.workoutId.equals(workoutId) & tbl.exerciseId.equals(exerciseId)))
        .go();
  }

  @override
  Future<List<ExerciseRepeat>> getExerciseRepeatsByDate(DateTime date) async {
    return await (database.select(database.exerciseRepeats)
          ..where((tbl) => tbl.date.equals(date)))
        .get();
  }

  @override
  Future<List<ExerciseRepeat>> getExerciseRepeatsByWorkout(String workoutId) async {
    return await (database.select(database.exerciseRepeats)
          ..where((tbl) => tbl.workoutId.equals(workoutId)))
        .get();
  }

  @override
  Future<ExerciseRepeat?> getExerciseRepeatById(String id) async {
    return await (database.select(database.exerciseRepeats)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }
}
