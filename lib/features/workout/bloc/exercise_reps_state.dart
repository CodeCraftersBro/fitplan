part of 'exercise_reps_bloc.dart';

sealed class ExerciseRepsState extends Equatable {
  const ExerciseRepsState();
  
  @override
  List<Object> get props => [];
}

final class ExerciseRepsInitial extends ExerciseRepsState {}
