part of 'exercise_search_bloc.dart';

sealed class ExerciseSearchState extends Equatable {
  const ExerciseSearchState();
  
  @override
  List<Object> get props => [];
}

class ExerciseSearchInitial extends ExerciseSearchState {}

class ExerciseSearchLoading extends ExerciseSearchState {
  @override
  List<Object> get props => [];
}

class ExerciseSearchLoaded extends ExerciseSearchState {
  final List<ExerciseSearch> items;

  const ExerciseSearchLoaded({required this.items});

  @override
  List<Object> get props => [items];
}

class ExerciseSearchCategorySelected extends ExerciseSearchState {
  // final String exerciseTypeId;

  // const ExerciseSearchCategorySelected(this.exerciseTypeId);

  // @override
  // List<Object> get props => [exerciseTypeId];

  final List<ExerciseSearch> items;

  const ExerciseSearchCategorySelected({required this.items});

  @override
  List<Object> get props => [items];
}


class ExerciseSearchError extends ExerciseSearchState {
  final String message;

  const ExerciseSearchError({required this.message});

  @override
  List<Object> get props => [message];
}



// инициализация ExerciseSearchInitial
// прогресс ExerciseSearchLoading
// ошибка ExerciseSearchError

// загружен список  ExerciseSearchLoaded
// выбрана категория ExerciseCategorySelected

// выбрано упражнение 
class ExerciseSelected extends ExerciseSearchState {
  final List<ExerciseSearch> selectedExercises;

  const ExerciseSelected(this.selectedExercises);

  @override
  List<Object> get props => [selectedExercises];
}
