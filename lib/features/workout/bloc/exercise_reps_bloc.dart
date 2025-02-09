import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exercise_reps_event.dart';
part 'exercise_reps_state.dart';

class ExerciseRepsBloc extends Bloc<ExerciseRepsEvent, ExerciseRepsState> {
  ExerciseRepsBloc() : super(ExerciseRepsInitial()) {
    on<ExerciseRepsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
