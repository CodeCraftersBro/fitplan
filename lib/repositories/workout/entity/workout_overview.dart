import 'package:fitplan/repositories/workout/models/exercise_repeat.dart';

class WorkoutOverview {
  final String workoutId;
  final int workoutSort;
  final bool workoutIsSet;
  final int workoutSetId;
  final String workoutExerciseIndicator;

  // Поля из модели Exercise
  final String workoutExerciseId;
  final String workoutExerciseName;

  // Поля из модели ExerciseType
  final String workoutExerciseTypeId;
  final String workoutExerciseTypeName;
  final String workoutExerciseTypeIcon;
  final String workoutExerciseTypeCategory;

  // Количество повторений
  final int workoutExerciseRepeats;

  // **Добавляем список повторений**
  final List<ExerciseRepeat> workoutExerciseRepeatList;

  WorkoutOverview({
    required this.workoutId,
    required this.workoutSort,
    required this.workoutIsSet,
    required this.workoutSetId,
    required this.workoutExerciseIndicator,
    required this.workoutExerciseId,
    required this.workoutExerciseName,
    required this.workoutExerciseTypeId,
    required this.workoutExerciseTypeName,
    required this.workoutExerciseTypeIcon,
    required this.workoutExerciseTypeCategory,
    required this.workoutExerciseRepeats,
    required this.workoutExerciseRepeatList, // Новый параметр
  });

  WorkoutOverview copyWith({
    String? workoutId,
    int? workoutSort,
    bool? workoutIsSet,
    int? workoutSetId,
    String? workoutExerciseIndicator,
    String? workoutExerciseId,
    String? workoutExerciseName,
    String? workoutExerciseTypeId,
    String? workoutExerciseTypeName,
    String? workoutExerciseTypeCategory,
    String? workoutExerciseTypeIcon,
    int? workoutExerciseRepeats,
    List<ExerciseRepeat>? workoutExerciseRepeatList, // Добавили в copyWith
  }) {
    return WorkoutOverview(
      workoutId: workoutId ?? this.workoutId,
      workoutSort: workoutSort ?? this.workoutSort,
      workoutIsSet: workoutIsSet ?? this.workoutIsSet,
      workoutSetId: workoutSetId ?? this.workoutSetId,
      workoutExerciseIndicator: workoutExerciseIndicator ?? this.workoutExerciseIndicator,
      workoutExerciseId: workoutExerciseId ?? this.workoutExerciseId,
      workoutExerciseName: workoutExerciseName ?? this.workoutExerciseName,
      workoutExerciseTypeId: workoutExerciseTypeId ?? this.workoutExerciseTypeId,
      workoutExerciseTypeName: workoutExerciseTypeName ?? this.workoutExerciseTypeName,
      workoutExerciseTypeIcon: workoutExerciseTypeIcon ?? this.workoutExerciseTypeIcon,
      workoutExerciseTypeCategory: workoutExerciseTypeCategory ?? this.workoutExerciseTypeCategory,
      workoutExerciseRepeats: workoutExerciseRepeats ?? this.workoutExerciseRepeats,
      workoutExerciseRepeatList: workoutExerciseRepeatList ?? this.workoutExerciseRepeatList, // Новый параметр
    );
  }
}
