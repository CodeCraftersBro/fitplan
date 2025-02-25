import 'package:fitplan/repositories/workout/exercise_repository_interface.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class ExerciseRepository implements ExerciseRepositoryInterface {
  final AppDatabase database;
  final Uuid uuid = const Uuid();

  ExerciseRepository({required this.database});

  @override
  Future<List<Exercise>> getExercises() async {
    return await database.select(database.exercises).get();
  }

  @override
  Future<Exercise?> getExerciseById(String id) async {
    return await (database.select(database.exercises)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> updateExercise() async {
    final List<ExercisesCompanion> exerciseDemo = [
      // # Arms (Руки)
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Bicep Curl', exerciseTypeId: '1'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Tricep Dip', exerciseTypeId: '1'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Hammer Curl', exerciseTypeId: '1'),

      // # Legs (Ноги)
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Squat', exerciseTypeId: '2'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Lunge', exerciseTypeId: '2'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Leg Press', exerciseTypeId: '2'),

      // # Stretching (Растяжка)
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Hamstring Stretch', exerciseTypeId: '3'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Quad Stretch', exerciseTypeId: '3'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Shoulder Stretch', exerciseTypeId: '3'),

      // # Shoulders (Плечи)
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Shoulder Press', exerciseTypeId: '4'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Lateral Raise', exerciseTypeId: '4'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Front Raise', exerciseTypeId: '4'),

      // # Back (Спина)
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Deadlift', exerciseTypeId: '5'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Pull-up', exerciseTypeId: '5'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Bent-over Row', exerciseTypeId: '5'),

      // # Abs (Пресс)
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Crunch', exerciseTypeId: '6'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Plank', exerciseTypeId: '6'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Russian Twist', exerciseTypeId: '6'),

      // # Chest (Грудь)
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Bench Press', exerciseTypeId: '7'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Chest Fly', exerciseTypeId: '7'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Incline Press', exerciseTypeId: '7'),

      // # Cardio (Кардио)
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Running', exerciseTypeId: '8'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Cycling', exerciseTypeId: '8'),
      ExercisesCompanion.insert(id: uuid.v4(), name: 'Jump Rope', exerciseTypeId: '8'),
    ];

    await database.batch((batch) {
      batch.insertAll(
        database.exercises,
        exerciseDemo,
        mode: InsertMode.insertOrReplace, // Обновляем записи, если они уже есть
      );
    });
  }

  Future<void> deleteAllExercise() async {
    await database.delete(database.exercises).go();
  }
}
