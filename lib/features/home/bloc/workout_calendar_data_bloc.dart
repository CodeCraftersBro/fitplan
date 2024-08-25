import 'package:fitplan/repositories/search/models/models.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_calendar_data_event.dart';
part 'workout_calendar_data_state.dart';

class WorkoutCalendarDataBloc
    extends Bloc<WorkoutCalendarDataEvent, WorkoutCalendarDataState> {
  final WorkoutRepositoryInterface workoutRepository;

  DateTime _getDateWithoutTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  WorkoutCalendarDataBloc(this.workoutRepository)
      : super(WorkoutCalendarDataInitial()) {
    on<LoadWorkoutCalendarData>(_onLoadWorkoutCalendarData);
  }

  Future<void> _onLoadWorkoutCalendarData(
    LoadWorkoutCalendarData event,
    Emitter<WorkoutCalendarDataState> emit,
  ) async {
    try {
      final workoutList = await workoutRepository
          .getExerciseListByDate(_getDateWithoutTime(event.selectedDate));
      emit(
        WorkoutCalendarDataLoaded(workouts: workoutList),
      );
    } catch (e) {
      emit(WorkoutCalendarFailure(e));
    }
  }
}
