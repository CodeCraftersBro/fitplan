import 'package:flutter_test/flutter_test.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:fitplan/repositories/workout/exercise_repeat_repository.dart';
import 'package:drift/drift.dart';

void main() {
  late AppDatabase database;
  late ExerciseRepeatRepository repository;

  setUp(() {
    database = AppDatabase(); // Используем в памяти SQLite
    repository = ExerciseRepeatRepository(database: database);
  });

  tearDown(() async {
    await database.close();
  });

  test('Добавление повторения', () async {
    final repeat = ExerciseRepeatsCompanion(
      id: Value('repeat_1'),
      sort: Value(1),
      date: Value(DateTime.now()),
      workoutId: Value('workout_1'),
      exerciseId: Value('exercise_1'),
      exerciseType: Value('strength'),
      weight: Value(50),
      reps: Value(10),
    );

    await repository.addExerciseRepeat(repeat);

    final savedRepeat = await (database.select(database.exerciseRepeats)
          ..where((tbl) => tbl.id.equals('repeat_1')))
        .getSingleOrNull();

    // expect(savedRepeat, isNotNull);
    expect(savedRepeat!.weight, 50);
    expect(savedRepeat.reps, 10);
  });

  test('Обновление повторения', () async {
    final repeat = ExerciseRepeatsCompanion(
      id: Value('repeat_2'),
      sort: Value(1),
      date: Value(DateTime.now()),
      workoutId: Value('workout_1'),
      exerciseId: Value('exercise_1'),
      exerciseType: Value('strength'),
      weight: Value(40),
      reps: Value(8),
    );

    await repository.addExerciseRepeat(repeat);

    final updatedRepeat = ExerciseRepeatsCompanion(
      id: Value('repeat_2'),
      sort: Value(1),
      date: Value(DateTime.now()),
      workoutId: Value('workout_1'),
      exerciseId: Value('exercise_1'),
      exerciseType: Value('strength'),
      weight: Value(60),
      reps: Value(12),
    );

    await repository.updateExerciseRepeat(updatedRepeat as ExerciseRepeat);

    final savedRepeat = await (database.select(database.exerciseRepeats)
          ..where((tbl) => tbl.id.equals('repeat_2')))
        .getSingleOrNull();

    // expect(savedRepeat, isNotNull);
    expect(savedRepeat!.weight, 60);
    expect(savedRepeat.reps, 12);
  });

  test('Удаление повторения', () async {
    final repeat = ExerciseRepeatsCompanion(
      id: Value('repeat_3'),
      sort: Value(1),
      date: Value(DateTime.now()),
      workoutId: Value('workout_1'),
      exerciseId: Value('exercise_1'),
      exerciseType: Value('strength'),
      weight: Value(45),
      reps: Value(9),
    );

    await repository.addExerciseRepeat(repeat);
    await repository.deleteExerciseRepeat('repeat_3');

    final deletedRepeat = await (database.select(database.exerciseRepeats)
          ..where((tbl) => tbl.id.equals('repeat_3')))
        .getSingleOrNull();

    // expect(deletedRepeat, isNull);
  });

  test('Получение повторений по тренировке', () async {
    final repeat1 = ExerciseRepeatsCompanion(
      id: Value('repeat_4'),
      sort: Value(1),
      date: Value(DateTime.now()),
      workoutId: Value('workout_1'),
      exerciseId: Value('exercise_1'),
      exerciseType: Value('strength'),
      weight: Value(50),
      reps: Value(10),
    );

    final repeat2 = ExerciseRepeatsCompanion(
      id: Value('repeat_5'),
      sort: Value(2),
      date: Value(DateTime.now()),
      workoutId: Value('workout_1'),
      exerciseId: Value('exercise_2'),
      exerciseType: Value('cardio'),
      distance: Value(5.0),
      duration: Value(1800),
    );

    await repository.addExerciseRepeat(repeat1);
    await repository.addExerciseRepeat(repeat2);

    final workoutRepeats = await repository.getExerciseRepeatsByWorkout('workout_1');

    expect(workoutRepeats.length, 2);
  });

  test('Получение повторений по дате', () async {
    final now = DateTime.now();

    final repeat1 = ExerciseRepeatsCompanion(
      id: Value('repeat_6'),
      sort: Value(1),
      date: Value(now),
      workoutId: Value('workout_2'),
      exerciseId: Value('exercise_3'),
      exerciseType: Value('stretching'),
      stretchDuration: Value(60),
    );

    final repeat2 = ExerciseRepeatsCompanion(
      id: Value('repeat_7'),
      sort: Value(2),
      date: Value(now),
      workoutId: Value('workout_2'),
      exerciseId: Value('exercise_4'),
      exerciseType: Value('strength'),
      weight: Value(70),
      reps: Value(8),
    );

    await repository.addExerciseRepeat(repeat1);
    await repository.addExerciseRepeat(repeat2);

    final dateRepeats = await repository.getExerciseRepeatsByDate(now);

    expect(dateRepeats.length, 2);
  });
}
