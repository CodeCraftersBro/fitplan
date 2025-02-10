import 'package:fitplan/repositories/search/models/models.dart';
import 'package:fitplan/repositories/search/search.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:drift/drift.dart';

class SearchRepository implements SearchRepositoryInterface {
  final AppDatabase database;

  SearchRepository({required this.database});

  @override
  Future<List<ExerciseSearch>> getExerciseCategories() async {
    final exerciseTypes = await database.select(database.exerciseTypes).get();

    return exerciseTypes.map((type) => ExerciseSearch(
          id: type.id,
          typeItem: "category",
          isSelected: false,
          exerciseId: "",
          exerciseTypeId: type.id,
          name: type.name,
          icon: type.icon ?? "",
        )).toList();
  }

  @override
  Future<List<ExerciseSearch>> getExercisesByTypeId(String id) async {
    final exercises = await (database.select(database.exercises)
          ..where((tbl) => tbl.exerciseTypeId.equals(id)))
        .get();

    return exercises.map((exercise) => ExerciseSearch(
          id: exercise.id,
          typeItem: "exercise",
          isSelected: false,
          exerciseId: exercise.id,
          exerciseTypeId: exercise.exerciseTypeId,
          name: exercise.name,
          icon: "", // Упражнения не имеют иконок
        )).toList();
  }

  @override
  Future<List<ExerciseSearch>> searchExercisesAndCategories(String query) async {
    final exercises = await (database.select(database.exercises)
          ..where((tbl) => tbl.name.like('%$query%')))
        .get();

    final exerciseTypes = await (database.select(database.exerciseTypes)
          ..where((tbl) => tbl.name.like('%$query%')))
        .get();

    final exerciseSearchList = <ExerciseSearch>[];

    // Добавляем упражнения
    exerciseSearchList.addAll(exercises.map((exercise) => ExerciseSearch(
          id: exercise.id,
          typeItem: "exercise",
          isSelected: false,
          exerciseId: exercise.id,
          exerciseTypeId: exercise.exerciseTypeId,
          name: exercise.name,
          icon: "",
        )));

    // Добавляем категории
    exerciseSearchList.addAll(exerciseTypes.map((type) => ExerciseSearch(
          id: type.id,
          typeItem: "category",
          isSelected: false,
          exerciseId: "",
          exerciseTypeId: type.id,
          name: type.name,
          icon: type.icon ?? "",
        )));

    return exerciseSearchList;
  }

  Future<void> addWorkout(WorkoutsCompanion workout) async {
    await database.into(database.workouts).insert(workout);
  }

  Future<void> addWorkouts(List<WorkoutsCompanion> workouts) async {
    await database.batch((batch) {
      batch.insertAll(database.workouts, workouts, mode: InsertMode.insertOrReplace);
    });
  }
  
}
