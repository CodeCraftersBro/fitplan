part of 'workout_editor_bloc.dart';

sealed class WorkoutEditorState extends Equatable {
  const WorkoutEditorState();

  @override
  List<Object> get props => [];
}

final class WorkoutEditorInitial extends WorkoutEditorState {}

final class WorkoutEditorLoading extends WorkoutEditorState {}

final class WorkoutEditorLoaded extends WorkoutEditorState {
  final List<Workout> workouts;

  const WorkoutEditorLoaded({required this.workouts});
  @override
  List<Object> get props => [workouts];
}

final class WorkoutEditorFailure extends WorkoutEditorState {
  final Object exception;

  const WorkoutEditorFailure(this.exception);
  @override
  List<Object> get props => [exception];
}

/// 🔄 **Новое состояние: обновление порядка упражнений**
final class WorkoutReordered extends WorkoutEditorState {
  final List<Workout> reorderedWorkouts;

  const WorkoutReordered({required this.reorderedWorkouts});
  @override
  List<Object> get props => [reorderedWorkouts];
}
