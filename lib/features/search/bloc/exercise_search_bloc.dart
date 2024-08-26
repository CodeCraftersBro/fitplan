import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/search/models/models.dart';
import 'package:fitplan/repositories/search/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:uuid/uuid.dart' as uuid_lib;

part 'exercise_search_event.dart';
part 'exercise_search_state.dart';

class ExerciseSearchBloc
    extends Bloc<ExerciseSearchEvent, ExerciseSearchState> {
  final SearchRepository searchRepository;
  List<ExerciseSearch> selectedExercises = [];
  ExerciseSearchBloc({
    required this.searchRepository,
  }) : super(ExerciseSearchInitial()) {
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

      // for (var item in categories) {
      //   print('ID: ${item.id} - ${item.name}');
      // }
      emit(ExerciseSearchLoaded(items: categories));
    } catch (e) {
      emit(ExerciseSearchError(message: e.toString()));
    }
  }

  void _onSearchExercises(
    SearchExercises event,
    Emitter<ExerciseSearchState> emit,
  ) async {
    emit(ExerciseSearchLoading());
    if (event.query.isEmpty) {
      try {
        final categories = await searchRepository.getExerciseCategories();
        emit(ExerciseSearchLoaded(items: categories));
      } catch (e) {
        emit(ExerciseSearchError(message: e.toString()));
      }
    } else {
      try {
        final results =
            await searchRepository.searchExercisesAndCategories(event.query);
        for (var item in results) {
          print('ID: ${item.id} - ${item.name} - type:${item.typeItem}');
        }
        emit(ExerciseSearchLoaded(items: results));
      } catch (e) {
        emit(ExerciseSearchError(message: e.toString()));
      }
    }
  }

  void _onSelectCategory(
    SelectCategory event,
    Emitter<ExerciseSearchState> emit,
  ) async {
    try {
      emit(ExerciseSearchLoading());
      final exercises =
          await searchRepository.getExercisesByTypeId(event.exerciseTypeId);
      // emit(ExerciseSearchLoaded(items: exercises));
      emit(ExerciseSearchCategorySelected(items: exercises));
    } catch (e) {
      emit(ExerciseSearchError(message: e.toString()));
    }
    // if (state is ExerciseSearchLoaded) {
    //   final loadedState = state as ExerciseSearchLoaded;
    //   final filteredExercises = loadedState.allExercises
    //       .where((exercise) => exercise.exerciseTypeId == event.typeId)
    //       .toList();
    //   emit(ExerciseCategorySelected(exercises: filteredExercises));
    // }
  }

  void _onToggleExerciseSelection(
    
      ToggleExerciseSelection event, Emitter<ExerciseSearchState> emit) {


    print("_onToggleExerciseSelection");
    if (selectedExercises.contains(event.exercise)) {
      selectedExercises.remove(event.exercise);
    } else {
      selectedExercises.add(event.exercise);
    }

    if (state is ExerciseSearchLoaded) {
        emit(ExerciseSearchLoaded(items:(state as ExerciseSearchLoaded).items));
    } else if (state is ExerciseSearchCategorySelected) {
        emit(ExerciseSearchCategorySelected(items:(state as ExerciseSearchCategorySelected).items));
    } else {
        emit(ExerciseSelected(selectedExercises));
    }
  }

  void _onAddSelectedExercisesToWorkout(
      AddSelectedExercisesToWorkout event,
      Emitter<ExerciseSearchState> emit) async {
    try {
      var uuid = uuid_lib.Uuid();
      //TODO add data
      // TODO add sort order
      // final date = _getDateWithoutTime(DateTime.now());
      final date = _getDateWithoutTime(event.selectedDate);

      for (var exerciseSearch in event.exercises) {
        var workout = Workout(
              uuid.v4(),
              0,
              date,
              false,
              '',
              exerciseSearch.exerciseId,
            );
        await searchRepository.addWorkout(workout);
       
        }
      selectedExercises.clear();
      // emit(ExerciseSearchInitial());
      
      final categories = await searchRepository.getExerciseCategories();

      for (var item in categories) {
        print('ID: ${item.id} - ${item.name}');
      }
      emit(ExerciseSearchLoaded(items: categories));

      
    } catch (e) {
      emit(ExerciseSearchError(message: e.toString()));
    }
  }
}
DateTime _getDateWithoutTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }