import 'package:fitplan/repositories/workout/exercise_type_repository_interface.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:drift/drift.dart';

class ExerciseTypeRepository implements ExerciseTypeRepositoryInterface {
  final AppDatabase database;

  ExerciseTypeRepository({required this.database});

  @override
  Future<void> updateExerciseTypesFromAPI() async {
    final List<ExerciseTypesCompanion> exerciseTypesFromAPI = [
      ExerciseTypesCompanion(
        id: Value('1'),
        name: Value('Arms'),
        icon: Value("💪"),
        category: Value('Strength'),
      ),
      ExerciseTypesCompanion(
        id: Value('2'),
        name: Value('Legs'),
        icon: Value('🦵'),
        category: Value('Strength'),
      ),
      ExerciseTypesCompanion(
        id: Value('3'),
        name: Value('Stretching'),
        icon: Value('🧘‍♂️'),
        category: Value('Stretching'),
      ),
      ExerciseTypesCompanion(
        id: Value('4'),
        name: Value('Shoulders'),
        icon: Value('🤾‍♂️'),
        category: Value('Strength'),
      ),
      ExerciseTypesCompanion(
        id: Value('5'),
        name: Value('Back'),
        icon: Value('🧗'),
        category: Value('Strength'),
      ),
      ExerciseTypesCompanion(
        id: Value('6'),
        name: Value('Abs'),
        icon: Value('🤸'),
        category: Value('Strength'),
      ),
      ExerciseTypesCompanion(
        id: Value('7'),
        name: Value('Chest'),
        icon: Value('🏋️‍♀️'),
        category: Value('Strength'),
      ),
      ExerciseTypesCompanion(
        id: Value('8'),
        name: Value('Cardio'),
        icon: Value('🫀'),
        category: Value('Cardio'),
      ),
    ];

    await database.batch((batch) {
      batch.insertAll(
        database.exerciseTypes,
        exerciseTypesFromAPI,
        mode: InsertMode.insertOrReplace, // 🔥 Обновляет данные, если уже есть
      );
    });
  }

  @override
  Future<List<ExerciseType>> getExerciseTypes() async {
    return await database.select(database.exerciseTypes).get();
  }

  @override
  Future<ExerciseType?> getExerciseTypeById(String id) async {
    return await (database.select(database.exerciseTypes)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> deleteAll() async {
    await database.delete(database.exerciseTypes).go();
  }
}
