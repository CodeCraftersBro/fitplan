class WorkoutOverview {
  final String workoutId;
  final int workoutSort;
  final bool workoutIsSet;
  final String workoutExerciseIndicator;
  
  // Поля из модели Exercise
  final String workoutExerciseId;
  final String workoutExerciseName;
  
  // Поля из модели ExerciseType
  final String workoutExerciseTypeId;
  final String workoutExerciseTypeName;
  final String workoutExerciseTypeIcon;

  WorkoutOverview({
    required this.workoutId,
    required this.workoutSort,
    required this.workoutIsSet,
    required this.workoutExerciseIndicator,
    required this.workoutExerciseId,
    required this.workoutExerciseName,
    required this.workoutExerciseTypeId,
    required this.workoutExerciseTypeName,
    required this.workoutExerciseTypeIcon,
  });
}