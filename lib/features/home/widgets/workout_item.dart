
import 'dart:developer';

import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/features/perform/bloc/exercise_repeat_bloc.dart';
import 'package:fitplan/features/perform/perform.dart';
import 'package:fitplan/repositories/workout/entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitplan/generated/l10n.dart';

class WorkoutItemWidget extends StatelessWidget {
  final WorkoutOverview workoutOverview;
  final DateTime selectedDate;
  const WorkoutItemWidget({super.key, required this.workoutOverview, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Text(
                workoutOverview.workoutExerciseTypeIcon,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workoutOverview.workoutExerciseName, //workouts[index].isSet.toString(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    _getFormattedRepsText(context,workoutOverview),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    _showModalPerform(context,workoutOverview,selectedDate);
                  },
                  icon: Icon(
                    Icons.wrap_text,
                    color: Theme.of(context).colorScheme.primary,
                  ))
            ],
          ),
        ],
      ),
    );
    ;
  }
}

/// **Форматирование текста повторений в зависимости от типа упражнения**
  String _getFormattedRepsText(BuildContext context, WorkoutOverview workout) {
    final int repeatsCount = workout.workoutExerciseRepeats;
    final appLocalizations = S.of(context);
    

  if (repeatsCount == 0) {
    return appLocalizations.reps_none;
  }
  switch (workout.workoutExerciseTypeCategory.toLowerCase()) {
    case "strength":
      return appLocalizations.reps_strength(repeatsCount);
    case "cardio":
      return appLocalizations.reps_cardio(repeatsCount);
    case "stretching":
      return appLocalizations.reps_stretching(repeatsCount);
    default:
      return appLocalizations.reps_generic(repeatsCount);
  }
  }
void _showModalPerform(BuildContext context, WorkoutOverview workoutOverview,DateTime selectedDate) async {
 
 List<Map<String, String>> existingSets = workoutOverview.workoutExerciseRepeatList.map((repeat) {
    return {
      if (repeat.weight != null) "weight": repeat.weight.toString(),
      if (repeat.reps != null) "reps": repeat.reps.toString(),
      if (repeat.distance != null) "distance": repeat.distance.toString(),
      if (repeat.duration != null) "duration": repeat.duration.toString(),
      if (repeat.stretchDuration != null) "stretchDuration": repeat.stretchDuration.toString(),
    };
  }).toList();

  log("existingSets: ${workoutOverview.workoutExerciseRepeatList}");
  log("Exercise: ${workoutOverview.workoutExerciseTypeName}");
  log("Category: ${workoutOverview.workoutExerciseTypeCategory}");
  // Открываем PerformScreen с переданными данными
  final performData = await showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    context: context,
    builder: (context) => PerformScreen(
      exerciseName: workoutOverview.workoutExerciseName,
      exerciseType: workoutOverview.workoutExerciseTypeCategory,
      existingSets: existingSets, // Передаем данные на экран
    ),
  );

  // Обрабатываем данные, если пользователь ввел новые данные
  if (performData != null) {
    context.read<ExerciseRepeatBloc>()
    .add(AddExerciseRepeat(workoutOverview: workoutOverview, performData: performData));

  }
    context.read<WorkoutCalendarDataBloc>().add(
      LoadWorkoutCalendarData(selectedDate: selectedDate),
    );
}