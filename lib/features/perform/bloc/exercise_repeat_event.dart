part of 'exercise_repeat_bloc.dart';

sealed class ExerciseRepeatEvent extends Equatable {
  const ExerciseRepeatEvent();

  @override
  List<Object> get props => [];
}


// Загрузка повторений для конкретного дня и упражнения
class LoadExerciseRepeats extends ExerciseRepeatEvent {
  final WorkoutOverview workoutOverview;
  final DateTime date;

  const LoadExerciseRepeats({required this.workoutOverview, required this.date});

  @override
  List<Object> get props => [workoutOverview, date];
}

// Добавление повторений (принимает WorkoutOverview и массив сетов)
class AddExerciseRepeat extends ExerciseRepeatEvent {
  final WorkoutOverview workoutOverview;
  final List<Map<String, String>> performData;

  const AddExerciseRepeat({required this.workoutOverview, required this.performData});

  @override
  List<Object> get props => [workoutOverview, performData];
}
