import 'package:fitplan/repositories/workout/workout_repository_interface.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:drift/drift.dart';

class WorkoutRepository implements WorkoutRepositoryInterface {
  final AppDatabase database;

  WorkoutRepository({required this.database});

  @override
  Future<List<Workout>> getExerciseListByDate(DateTime date) async {
    return await (database.select(database.workouts)
          ..where((tbl) => tbl.date.equals(date)))
        .get();
  }

  @override
  Future<void> addWorkout(Workout workout) async {
    await database.into(database.workouts).insert(
      WorkoutsCompanion(
        id: Value(workout.id),
        sort: Value(workout.sort),
        date: Value(workout.date),
        isSet: Value(workout.isSet),
        setId: Value(workout.setId),
        exerciseIndicator: Value(workout.exerciseIndicator),
        exerciseId: Value(workout.exerciseId),
      ),
    );
  }

   Future<void> addWorkouts(List<WorkoutsCompanion> workouts) async {
    await database.batch((batch) {
      batch.insertAll(database.workouts, workouts, mode: InsertMode.insertOrReplace);
    });
  }


  @override
  Future<List<Workout>> getAllWorkouts() async {
    return await database.select(database.workouts).get();
  }

  @override
  Future<void> deleteAllWorkouts() async {
    await database.delete(database.workouts).go();
  }

  @override
  Future<void> deleteWorkoutById(String id) async {
    await (database.delete(database.workouts)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  @override
  Future<int> getNextSortOrderForDate(DateTime date) async {
    final query = await (database.select(database.workouts)
          ..where((tbl) => tbl.date.equals(date)))
        .get();

    if (query.isEmpty) {
      return 1;
    } else {
      final maxSortOrder = query.map((w) => w.sort).reduce((a, b) => a > b ? a : b);
      return maxSortOrder + 1;
    }
  }

  @override
  Future<int> getNextSetIdForDate(DateTime date) async {
    final query = await (database.select(database.workouts)
          ..where((tbl) => tbl.date.equals(date)))
        .get();

    if (query.isEmpty) {
      return 1;
    } else {
      final maxSetId = query.map((w) => w.setId).reduce((a, b) => a > b ? a : b);
      return maxSetId + 1;
    }
  }

  @override
  Future<void> updateWorkouts(List<Workout> workouts) async {
    await database.batch((batch) {
      for (var workout in workouts) {
        batch.insert(
          database.workouts,
          WorkoutsCompanion(
            id: Value(workout.id),
            sort: Value(workout.sort),
            date: Value(workout.date),
            isSet: Value(workout.isSet),
            setId: Value(workout.setId),
            exerciseIndicator: Value(workout.exerciseIndicator),
            exerciseId: Value(workout.exerciseId),
          ),
          mode: InsertMode.insertOrReplace, // Обновляет записи, если они уже есть
        );
      }
    });
  }

  @override
  Future<void> deleteWorkoutsByDate(DateTime date) async {
    await (database.delete(database.workouts)
          ..where((tbl) => tbl.date.equals(date)))
        .go();
  }
}
