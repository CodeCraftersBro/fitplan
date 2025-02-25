part of 'exercise_reps_bloc.dart';

sealed class ExerciseRepsEvent extends Equatable {
  const ExerciseRepsEvent();

  @override
  List<Object> get props => [];
}

class LoadReps extends ExerciseRepsEvent {}

class AddReps extends ExerciseRepsEvent {
  final String exerciseId;
  final int reps;

  const AddReps({required this.exerciseId, required this.reps});

  @override
  List<Object> get props => [exerciseId, reps];
}

class UpdateReps extends ExerciseRepsEvent {
  final String exerciseId;
  final int newReps;

  const UpdateReps({required this.exerciseId, required this.newReps});

  @override
  List<Object> get props => [exerciseId, newReps];
}

class DeleteReps extends ExerciseRepsEvent {
  final String exerciseId;

  const DeleteReps({required this.exerciseId});

  @override
  List<Object> get props => [exerciseId];
}
