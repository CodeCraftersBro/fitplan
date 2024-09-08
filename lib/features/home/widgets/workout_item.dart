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
                    "Круг №"+workoutOverview.workoutSort.toString(),
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
                  onPressed: () {},
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
