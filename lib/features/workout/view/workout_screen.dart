import 'dart:developer';

import 'package:fitplan/features/workout/widgets/widgets.dart';
import 'package:fitplan/repositories/workout/entity/entity.dart';
import 'package:fitplan/repositories/workout/models/models.dart';
import 'package:fitplan/repositories/workout/workout.dart';
import 'package:fitplan/ui/widgets/drag_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutScreen extends StatefulWidget {
  final DateTime selectedDate;
  final List<WorkoutOverview> workoutOverviewList;

  const WorkoutScreen(
      {super.key,
      required this.selectedDate,
      required this.workoutOverviewList});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late List<WorkoutOverview> workoutItems = [];

  Set<int> selectedIndices = {};

  @override
  void initState() {
    super.initState();
    workoutItems = widget.workoutOverviewList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.5,
        maxChildSize: 1,
        expand: false,
        builder: (_, controller) {
          
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            margin: const EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(child: DragIndicator()),
                Expanded(
                  child: ReorderableListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    onReorder: _onReorder,
                    children: [
                      for (int index = 0; index < workoutItems.length; index++)
                        WorkoutReorderableItemWidget(
                          key: ValueKey(workoutItems[index].workoutId),
                          workoutOverview: workoutItems[index],
                          index: index,
                          selectedIndices: selectedIndices.toList(),
                          onSelected: (int selectedIndex) {
                            setState(() {
                              if (selectedIndices.contains(selectedIndex)) {
                                selectedIndices.remove(selectedIndex);
                              } else {
                                selectedIndices.add(selectedIndex);
                              }
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: _buildFloatingActionButtons(),
    );
  }

  Widget _buildFloatingActionButtons() {
    if (selectedIndices.isEmpty) {
      return FloatingActionButton(
        onPressed: _saveWorkouts,
        heroTag: 'save',
        tooltip: 'Сохранить',
        child: const Icon(Icons.save),
      );
    } else if (selectedIndices.length == 1 && workoutItems[selectedIndices.first].workoutIsSet) {
    return FloatingActionButton(
      heroTag: 'break_superset',
      onPressed: _breakSuperset,
      tooltip: 'Разорвать набор',
      child: const Icon(Icons.link_off, color: Colors.white),
    );
  
    } else if (selectedIndices.length == 1) {
      return FloatingActionButton(
        heroTag: 'delete',
        onPressed: _deleteSelectedItems,
        tooltip: 'Удалить',
        child: const Icon(Icons.delete),
      );
    } else if (_areSelectedItemsConsecutive()) {
      return FloatingActionButton(
        heroTag: 'superset',
        onPressed: _makeSuperset,
        tooltip: 'Суперсет',
        child: const Icon(Icons.link, color: Colors.white),
      );
    } else {
      return Container();
    }
  }

  void _onReorder(int oldIndex, int newIndex) {
    log('_onReorder');
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final WorkoutOverview item = workoutItems.removeAt(oldIndex);
      workoutItems.insert(newIndex, item);

      // Обновляем selectedIndices после reorder
      Set<int> updatedIndices = {};
      for (var index in selectedIndices) {
        if (index == oldIndex) {
          updatedIndices.add(newIndex);
        } else if (index > oldIndex && index < newIndex) {
          updatedIndices.add(index - 1);
        } else if (index < oldIndex && index >= newIndex) {
          updatedIndices.add(index + 1);
        } else {
          updatedIndices.add(index);
        }
      }
      selectedIndices = updatedIndices;
    });
  }

  bool _areSelectedItemsConsecutive() {
    if (selectedIndices.length < 2) return false;

    final List<int> sortedIndices = selectedIndices.toList()..sort();
    for (int i = 0; i < sortedIndices.length - 1; i++) {
      if (sortedIndices[i] + 1 != sortedIndices[i + 1]) {
        return false;
      }
    }
    return true;
  }

  void _saveWorkouts() {
    log("====_saveWorkouts ===");
    // for (int i = 0; i < workoutItems.length; i++) {
    //   print(workoutItems[i].workoutId +
    //       " || " +
    //       workoutItems[i].workoutSort.toString());
    // }
    Navigator.pop(context, workoutItems);
  }

  void _deleteSelectedItems() {
    setState(() {
      workoutItems.removeWhere(
          (item) => selectedIndices.contains(workoutItems.indexOf(item)));
      selectedIndices.clear();
    });
  }

  void _makeSuperset() {
  setState(() {
    // Найдем максимальный workoutSetId среди всех элементов
    int maxSetId = workoutItems
        .where((item) => item.workoutIsSet)
        .map((item) => item.workoutSetId ?? 0) // Если нет setId, считаем его нулевым
        .fold(0, (prev, current) => current > prev ? current : prev);

    // Проверяем, есть ли в выделенных элементах уже существующий сет
    bool existingSetInSelection = selectedIndices.any((index) => workoutItems[index].workoutIsSet);

    // Если в выделенных элементах есть уже существующий сет, получаем его setId
    int? existingSetId = existingSetInSelection
        ? workoutItems
            .firstWhere((item) => selectedIndices.contains(workoutItems.indexOf(item)) && item.workoutIsSet)
            .workoutSetId
        : null;

    // Если есть существующий setId, используем его, иначе увеличиваем maxSetId
    int newSetId = existingSetId ?? (maxSetId + 1);

    // Объединяем выделенные элементы в сет с новым setId
    for (var index in selectedIndices) {
      workoutItems[index] = workoutItems[index].copyWith(
        workoutIsSet: true,
        workoutSetId: newSetId,
      );
    }

    selectedIndices.clear(); // Очищаем выбор после создания сета
  });
}

  void _breakSuperset() {
  setState(() {
    for (var index in selectedIndices) {
      // Устанавливаем workoutIsSet в false для выбранных элементов
      workoutItems[index] = workoutItems[index].copyWith(workoutIsSet: false);
    }
    selectedIndices.clear(); // Очищаем выбор после разрыва
  });
}
}
