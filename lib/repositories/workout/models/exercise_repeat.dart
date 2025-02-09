import 'package:realm/realm.dart';

part 'exercise_repeat.realm.dart';

@RealmModel()
class _ExerciseRepeat {
  @PrimaryKey()
  late String id;
  late int sort;
  late DateTime date;

  late String workoutId;
  late String exerciseId;

  late String exerciseType; // "strength", "cardio", "stretching"

  // Данные для силовых упражнений (вес + количество повторений)
  late int? weight; // Вес (в кг)
  int? reps; // Количество повторений

  // Данные для кардио (расстояние + время)
  double? distance; // Расстояние (в км)
  int? duration; // Время (в секундах)

  // Данные для растяжки / планки (только время)
  int? stretchDuration; // Время (в секундах)
}
