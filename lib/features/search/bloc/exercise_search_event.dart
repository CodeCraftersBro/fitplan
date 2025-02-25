part of 'exercise_search_bloc.dart';

sealed class ExerciseSearchEvent extends Equatable {
  const ExerciseSearchEvent();

  @override
  List<Object> get props => [];
}


class FetchInitialData extends ExerciseSearchEvent {
  // final DateTime selectedDate;

  // const FetchInitialData(this.selectedDate);
}


class SearchExercises extends ExerciseSearchEvent {
  final String query;

  const SearchExercises(this.query);

  @override
  List<Object> get props => [query];
}

class SelectCategory extends ExerciseSearchEvent {
  final String exerciseTypeId;

  const SelectCategory(this.exerciseTypeId);

  @override
  List<Object> get props => [exerciseTypeId];
}

class ToggleExerciseSelection extends ExerciseSearchEvent {
  final ExerciseSearch exercise;

  const ToggleExerciseSelection(this.exercise);

  @override
  List<Object> get props => [exercise];
}

class AddSelectedExercisesToWorkout extends ExerciseSearchEvent {
  final List<ExerciseSearch> exercises;
  final DateTime selectedDate;

  const AddSelectedExercisesToWorkout({
    required this.exercises,
    required this.selectedDate,
  });
  @override
  List<Object> get props => [exercises];
}

