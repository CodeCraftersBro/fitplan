import 'package:fitplan/repositories/search/models/models.dart';
import 'package:fitplan/repositories/search/search.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:realm/realm.dart';

class SearchRepository implements SearchRepositoryInterface {
  final Realm realm;

  SearchRepository({required this.realm});

  @override
  Future<List<ExerciseSearch>> getExerciseCategories() async {
    // Получаем список категорий из базы данных Realm
    final exerciseTypes = realm.all<ExerciseType>();

    // Преобразуем их в список ExerciseSearch
    return exerciseTypes
        .map((type) => ExerciseSearch(
              id: type.id,
              typeItem: "category",
              isSelected: false,
              exerciseId: "",
              exerciseTypeId: type.id,
              name: type.name,
              icon: type.icon,
            ))
        .toList();
  }

  @override
  Future<List<ExerciseSearch>> getExercisesByTypeId(String id) async {
    final exercises = realm.query<Exercise>('exerciseTypeId == "$id"');
    return exercises.map((exercise) => ExerciseSearch(
      id: exercise.id,
      typeItem: "exercise",
      isSelected: false,
      exerciseId: exercise.id,
      exerciseTypeId: exercise.exerciseTypeId,
      name: exercise.name,
      icon: "",
    )).toList();
  }

  @override
  Future<List<ExerciseSearch>> searchExercisesAndCategories(
      String query) async {
    final escapedQuery = query.replaceAll("'", "\\'");

    final exercises = realm.query<Exercise>("name CONTAINS[c] '$escapedQuery'");
    final exerciseTypes =
        realm.query<ExerciseType>("name CONTAINS[c] '$escapedQuery'");

    final exerciseSearchList = <ExerciseSearch>[];

    exerciseSearchList.addAll(exercises.map((exercise) => ExerciseSearch(
          id: exercise.id, // предположим, что id можно преобразовать в int
          typeItem: "exercise",
          isSelected: false,
          exerciseId: exercise.id,
          exerciseTypeId: exercise.exerciseTypeId,
          name: exercise.name,
          icon: "", // у упражнений нет иконок
        )));

    // Добавляем категории в список
    exerciseSearchList.addAll(exerciseTypes.map((type) => ExerciseSearch(
          id: type.id, // предположим, что id можно преобразовать в int
          typeItem: "category",
          isSelected: false,
          exerciseId: "",
          exerciseTypeId: type.id,
          name: type.name,
          icon: type.icon,
        )));

    return exerciseSearchList;
  }

  Future<void> addWorkout(Workout workout) async {
    realm.write(() {
      realm.add(workout);
    });
  }
  
}
