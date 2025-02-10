import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/search/models/models.dart';
import 'package:fitplan/repositories/search/search.dart';
import 'package:fitplan/repositories/workout/database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart' as uuid_lib;
import 'package:drift/drift.dart';

part 'exercise_search_event.dart';
part 'exercise_search_state.dart';

class ExerciseSearchBloc extends Bloc<ExerciseSearchEvent, ExerciseSearchState> {
  final SearchRepository searchRepository;
  List<ExerciseSearch> selectedExercises = [];

  ExerciseSearchBloc({required this.searchRepository}) : super(ExerciseSearchInitial()) {
    on<ExerciseSearchEvent>((event, emit) async => switch (event) {
      FetchInitialData() => _onFetchInitialData(event, emit),
      SearchExercises() => _onSearchExercises(event, emit),
      SelectCategory() => _onSelectCategory(event, emit),
      ToggleExerciseSelection() => _onToggleExerciseSelection(event, emit),
      AddSelectedExercisesToWorkout() => _onAddSelectedExercisesToWorkout(event, emit),
    });
  }

  Future<void> _onFetchInitialData(
    FetchInitialData event,
    Emitter<ExerciseSearchState> emit,
  ) async {
    print('_onFetchInitialData');
    try {
      final categories = await searchRepository.getExerciseCategories();
      emit(ExerciseSearchLoaded(items: categories));
    } catch (e) {
      emit(ExerciseSearchError(message: e.toString()));
    }
  }

  Future<void> _onSearchExercises(
    SearchExercises event,
    Emitter<ExerciseSearchState> emit,
  ) async {
    emit(ExerciseSearchLoading());
    try {
      final results = event.query.isEmpty
          ? await searchRepository.getExerciseCategories()
          : await searchRepository.searchExercisesAndCategories(event.query);
      
      emit(ExerciseSearchLoaded(items: results));
    } catch (e) {
      emit(ExerciseSearchError(message: e.toString()));
    }
  }

  Future<void> _onSelectCategory(
    SelectCategory event,
    Emitter<ExerciseSearchState> emit,
  ) async {
    try {
      emit(ExerciseSearchLoading());
      final exercises = await searchRepository.getExercisesByTypeId(event.exerciseTypeId);
      emit(ExerciseSearchCategorySelected(items: exercises));
    } catch (e) {
      emit(ExerciseSearchError(message: e.toString()));
    }
  }

  void _onToggleExerciseSelection(
    ToggleExerciseSelection event,
    Emitter<ExerciseSearchState> emit,
  ) {
    print("_onToggleExerciseSelection");
    if (selectedExercises.contains(event.exercise)) {
      selectedExercises.remove(event.exercise);
    } else {
      selectedExercises.add(event.exercise);
    }

    if (state is ExerciseSearchLoaded) {
      emit(ExerciseSearchLoaded(items: (state as ExerciseSearchLoaded).items));
    } else if (state is ExerciseSearchCategorySelected) {
      emit(ExerciseSearchCategorySelected(items: (state as ExerciseSearchCategorySelected).items));
    } else {
      emit(ExerciseSelected(selectedExercises));
    }
  }

  Future<void> _onAddSelectedExercisesToWorkout(
    AddSelectedExercisesToWorkout event,
    Emitter<ExerciseSearchState> emit,
  ) async {
    try {
      var uuid = uuid_lib.Uuid();
      final date = _getDateWithoutTime(event.selectedDate);

      List<WorkoutsCompanion> workoutList = [];

      for (var exerciseSearch in event.exercises) {
        var workout = WorkoutsCompanion(
          id: Value(uuid.v4()),
          sort: Value(0), // TODO: Установить правильный порядок сортировки
          date: Value(date),
          isSet: Value(false),
          setId: Value(0),
          exerciseIndicator: Value(''),
          exerciseId: Value(exerciseSearch.exerciseId),
        );
        workoutList.add(workout);
      }

      await searchRepository.addWorkouts(workoutList);

      selectedExercises.clear();

      final categories = await searchRepository.getExerciseCategories();
      emit(ExerciseSearchLoaded(items: categories));
    } catch (e) {
      emit(ExerciseSearchError(message: e.toString()));
    }
  }

  DateTime _getDateWithoutTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
