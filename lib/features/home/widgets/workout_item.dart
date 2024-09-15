
import 'dart:developer';

import 'package:fitplan/features/perform/perform.dart';
import 'package:fitplan/repositories/workout/entity/entity.dart';
import 'package:flutter/material.dart';

class WorkoutItemWidget extends StatelessWidget {
  final WorkoutOverview workoutOverview;
  const WorkoutItemWidget({super.key, required this.workoutOverview});

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
                    "Подход №"+workoutOverview.workoutSort.toString(),
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
                    _showModalPerform(context,workoutOverview);
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

void _showModalPerform(BuildContext context, WorkoutOverview workoutOverview) async {
  // Пример данных, которые вы можете передавать в PerformScreen
  final List<Map<String, String>> existingSets = [
    // {'weight': '20', 'reps': '12'},
    // {'weight': '30', 'reps': '10'},
  ];

  log(workoutOverview.workoutExerciseTypeName);
  log(workoutOverview.workoutExerciseTypeCategory);
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
    // performData содержит новые или отредактированные данные от экрана
    print("Полученные данные: $performData");

    // Здесь вы можете сделать что-то с полученными данными, например, сохранить их в базе данных
  }
}
