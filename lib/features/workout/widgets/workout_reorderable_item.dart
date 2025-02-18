import 'package:fitplan/features/home/widgets/widgets.dart';
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
    
    Widget lineIndicator;

    switch (workoutOverview.workoutExerciseIndicator) {
      case "down": // LineDirection.down:
        // lineIndicator = buildDashedLineIndicator(
        //     36);
        lineIndicator = buildDashedLineIndicator(
          LineDirection.down,
          70,
          context,
        ); // Высота от центра вниз
        break;
      case 'up': //LineDirection.up:
        lineIndicator = buildDashedLineIndicator(
          LineDirection.up,
          70,
          context,
        );
        break;
      case "middle": //LineDirection.middle:
        lineIndicator = buildDashedLineIndicator(
          LineDirection.middle,
          70,
          context,
        );

        break;
      default:
        lineIndicator = const SizedBox(height: 72); // Нет линии
    }
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
            (workoutOverview.workoutIsSet)
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                        height: 72,
                      ),
                      lineIndicator,
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onPrimary,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(
                    width: 0,
                    height: 72,
                  ),
            if (workoutOverview.workoutIsSet) const SizedBox(width: 10),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
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
                                workoutOverview
                                    .workoutExerciseName, //workouts[index].isSet.toString(),
                                style: isSelected
                                    ? Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            fontSize: 18,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface)
                                    : Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            fontSize: 18,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface),
                              ),
                              // Text(
                              //   "",
                              //   style: isSelected
                              //       ? Theme.of(context)
                              //           .textTheme
                              //           .titleMedium
                              //           ?.copyWith(
                              //               fontSize: 10,
                              //               color: Theme.of(context)
                              //                   .colorScheme
                              //                   .surface)
                              //       : Theme.of(context)
                              //           .textTheme
                              //           .titleMedium
                              //           ?.copyWith(
                              //               fontSize: 10,
                              //               color: Theme.of(context)
                              //                   .colorScheme
                              //                   .onSurface),
                              // ),
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
