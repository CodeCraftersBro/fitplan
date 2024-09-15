// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  WorkoutOverview( {
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
      workoutExerciseTypeCategory: workoutExerciseTypeCategory ?? this.workoutExerciseTypeCategory
    );
  }
}
