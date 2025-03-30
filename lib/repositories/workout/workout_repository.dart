import 'dart:developer';

import 'package:fitplan/repositories/workout/workout_repository_interface.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:drift/drift.dart';

class WorkoutRepository implements WorkoutRepositoryInterface {
  final AppDatabase database;

  WorkoutRepository({required this.database});

  @override
  Future<List<Workout>> getExerciseListByDate(DateTime date) async {
    final query = database.select(database.workouts)
    ..where((tbl) => tbl.date.equals(date));

  query.orderBy([(tbl) => OrderingTerm.asc(tbl.sort)]); // ✅ Применяем сортировку отдельно
 log("📌 Загрузка упражнений для даты $date в отсортированном порядке");
  return await query.get(); // ✅ Теперь можно вызвать `.get()`
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
    log("🛠 Удаление $id");
    //TODO: add delete in table repeats
    await (database.delete(database.workouts)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  /// 🔄 **Оптимизированный метод получения следующего `sort`**
  @override
  Future<int> getNextSortOrderForDate(DateTime date) async {
    final maxSort = await (database.select(database.workouts)
          ..where((tbl) => tbl.date.equals(date))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.sort)])
          ..limit(1))
        .getSingleOrNull();

    return (maxSort?.sort ?? 0) + 1;
  }

  /// 🔄 **Оптимизированный метод получения следующего `setId`**
  @override
  Future<int> getNextSetIdForDate(DateTime date) async {
    final maxSetId = await (database.select(database.workouts)
          ..where((tbl) => tbl.date.equals(date))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.setId)])
          ..limit(1))
        .getSingleOrNull();

    return (maxSetId?.setId ?? 0) + 1;
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
    log("🛠 Удаление $date");
    await (database.delete(database.workouts)
          ..where((tbl) => tbl.date.equals(date)))
        .go();
  }

  /// 🔄 **Обновление сортировки тренировки**
  Future<void> updateWorkoutSort({required String workoutId, required int newSort}) async {
     log("🛠 Обновление `sort` в базе для ID: $workoutId -> новый `sort`: $newSort");

      await (database.update(database.workouts)
            ..where((tbl) => tbl.id.equals(workoutId)))
          .write(WorkoutsCompanion(
            sort: Value(newSort),
          ));

      log("✅ `sort` обновлен в БД для ID: $workoutId");
  }

  /// 🔄 **Обновление `setId` тренировки**
  Future<void> updateWorkoutSetId(
    {required String workoutId, 
    required int newSetId,
    required bool newIsSet,}) async {
    await (database.update(database.workouts)
          ..where((tbl) => tbl.id.equals(workoutId)))
        .write(WorkoutsCompanion(
          setId: Value(newSetId),
          isSet: Value(newIsSet),
        ));
  }
}
