import 'package:fitplan/repositories/workout/entity/entity.dart';
import 'package:flutter/material.dart';

class WorkoutReorderableItemWidget extends StatelessWidget {
  final WorkoutOverview workoutOverview;
  final int index;
  final List<int> selectedIndices;
  final void Function(int) onSelected;
  
  const WorkoutReorderableItemWidget({
    super.key,
    required this.workoutOverview,
    required this.index,
    required this.selectedIndices,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndices.contains(index);
    return GestureDetector(
            key: ValueKey(index),
            onTap: () {
              onSelected(index);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 0, height: 72),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isSelected
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.surface,
                      ),
                      child: Padding(
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
                                const SizedBox(width: 10),
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
                                      "${workoutOverview.workoutSort} : ${workoutOverview.workoutId}",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            fontSize: 10,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.drag_handle,
                              color: isSelected
                                  ? Theme.of(context).colorScheme.surface
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
    
  }
}

