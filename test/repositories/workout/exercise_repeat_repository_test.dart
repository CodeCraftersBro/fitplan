import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';

void main() {
  late Realm realm;
  late ExerciseRepeatRepository repository;

  setUp(() {
    final config = Configuration.inMemory([ExerciseRepeat.schema]);
    realm = Realm(config);
    repository = ExerciseRepeatRepository(realm: realm);
  });

  tearDown(() {
    realm.close();
  });

  test('Добавление повторения', () async {
    final repeat = ExerciseRepeat(
      'repeat_1',
       1,
      DateTime.now(),
      'workout_1',
      'exercise_1',
      'strength',
      weight: 50,
      reps: 10
    );

  await repository.addExerciseRepeat(repeat);

  final savedRepeat = realm.find<ExerciseRepeat>('repeat_1');


    expect(savedRepeat, isNotNull);
    expect(savedRepeat!.weight, 50);
    expect(savedRepeat.reps, 10);
  });

  test('Обновление повторения', () async {
    final repeat = ExerciseRepeat(
      'repeat_2',
      1,
      DateTime.now(),
      'workout_1',
      'exercise_1',
      'strength',
      weight: 40,
      reps: 8,
    );

    await repository.addExerciseRepeat(repeat);

    final updatedRepeat = ExerciseRepeat(
      'repeat_2',
      1,
      DateTime.now(),
      'workout_1',
      'exercise_1',
      'strength',
      weight: 60, // Новый вес
      reps: 12, // Новое количество повторений
    );

    await repository.updateExerciseRepeat(updatedRepeat);

    final savedRepeat = realm.find<ExerciseRepeat>('repeat_2');

    expect(savedRepeat, isNotNull);
    expect(savedRepeat!.weight, 60);
    expect(savedRepeat.reps, 12);
  });

  test('Удаление повторения', () async {
    final repeat = ExerciseRepeat(
      'repeat_3',
      1,
      DateTime.now(),
      'workout_1',
      'exercise_1',
      'strength',
      weight: 45,
      reps: 9,
    );

    await repository.addExerciseRepeat(repeat);
    await repository.deleteExerciseRepeat('repeat_3');

    final deletedRepeat = realm.find<ExerciseRepeat>('repeat_3');

    expect(deletedRepeat, isNull);
  });

  // test('Получение повторений по тренировке', () async {
  //   final repeat1 = ExerciseRepeat(
  //     id: 'repeat_4',
  //     sort: 1,
  //     date: DateTime.now(),
  //     workoutId: 'workout_1',
  //     exerciseId: 'exercise_1',
  //     exerciseType: 'strength',
  //     weight: 50,
  //     reps: 10,
  //   );

  //   final repeat2 = ExerciseRepeat(
  //     id: 'repeat_5',
  //     sort: 2,
  //     date: DateTime.now(),
  //     workoutId: 'workout_1',
  //     exerciseId: 'exercise_2',
  //     exerciseType: 'cardio',
  //     distance: 5.0,
  //     duration: 1800,
  //   );

  //   await repository.addExerciseRepeat(repeat1);
  //   await repository.addExerciseRepeat(repeat2);

  //   final workoutRepeats = await repository.getExerciseRepeatsByWorkout('workout_1');

  //   expect(workoutRepeats.length, 2);
  // });

  // test('Получение повторений по дате', () async {
  //   final now = DateTime.now();

  //   final repeat1 = ExerciseRepeat(
  //     id: 'repeat_6',
  //     sort: 1,
  //     date: now,
  //     workoutId: 'workout_2',
  //     exerciseId: 'exercise_3',
  //     exerciseType: 'stretching',
  //     stretchDuration: 60,
  //   );

  //   final repeat2 = ExerciseRepeat(
  //     id: 'repeat_7',
  //     sort: 2,
  //     date: now,
  //     workoutId: 'workout_2',
  //     exerciseId: 'exercise_4',
  //     exerciseType: 'strength',
  //     weight: 70,
  //     reps: 8,
  //   );

  //   await repository.addExerciseRepeat(repeat1);
  //   await repository.addExerciseRepeat(repeat2);

  //   final dateRepeats = await repository.getExerciseRepeatsByDate(now);

  //   expect(dateRepeats.length, 2);
  // });
}
