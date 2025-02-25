part of 'exercise_repeat_bloc.dart';

sealed class ExerciseRepeatState extends Equatable {
  const ExerciseRepeatState();
  
  @override
  List<Object> get props => [];
}

final class ExerciseRepeatInitial extends ExerciseRepeatState {}

// Состояние, когда повторения загружены
class ExerciseRepeatsLoaded extends ExerciseRepeatState {
  final List<ExerciseRepeat> repeats;

  const ExerciseRepeatsLoaded({required this.repeats});

  @override
  List<Object> get props => [repeats];
}
