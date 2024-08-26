import 'package:fitplan/ui/widgets/drag_indicator.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<WorkoutItem> workoutItems = [
    WorkoutItem(name: "Barbell split squat", isSuperset: true),
    WorkoutItem(name: "Push-ups", isSuperset: true),
    WorkoutItem(name: "Barbell bicep curl", isSuperset: true),
    WorkoutItem(name: "Seated cable row", isSuperset: true),
    WorkoutItem(name: "Step climber", isSuperset: true),
    WorkoutItem(name: "Barbell bicep curl", isSuperset: false),
    WorkoutItem(name: "Treadmill", isSuperset: false),
    WorkoutItem(name: "Dumbbell concentration curl", isSuperset: false),
    WorkoutItem(name: "Турник", isSuperset: true),
    WorkoutItem(name: "Topo", isSuperset: true),
    WorkoutItem(name: "Back stretching", isSuperset: true),
  ];


  Set<int> selectedIndices = {};


  @override
  Widget build(BuildContext context) {
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
          const Center(
            child: DragIndicator(),
          ),
          Expanded(
            child: ReorderableListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              onReorder: _onReorder,
              children: [
                for (int index = 0; index < workoutItems.length; index++)
                  _buildListItem(workoutItems[index], index),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (selectedIndices.isEmpty)
                  ElevatedButton(
                    onPressed: () {
                      // Handle save action
                    },
                    child: const Text('Сохранить'),
                  )
                else if (selectedIndices.length == 1)
                  TextButton(
                    onPressed: _deleteSelectedItems,
                    child: Text(
                      'Удалить',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                else if (_areSelectedItemsConsecutive())
                  TextButton(
                    onPressed: _makeSuperset,
                    child: Text(
                      'Суперсет',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final WorkoutItem item = workoutItems.removeAt(oldIndex);
      workoutItems.insert(newIndex, item);

      // Update selected indices after reordering
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


 Widget _buildListItem22(WorkoutItem item, int index) {
    return ListTile(
      key: ValueKey(item),
      leading: Icon(
        item.isSuperset ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: item.isSuperset ? Colors.white : Colors.grey,
      ),
      title: Text(item.name),
      trailing: const Icon(Icons.drag_handle),
      onTap: () {
        // Handle item tap if needed
      },
    );
  }
   Widget _buildListItem(WorkoutItem item, int index) {
    final isSelected = selectedIndices.contains(index);

    return GestureDetector(
      key: ValueKey(index), 
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedIndices.remove(index);
          } else {
            selectedIndices.add(index);
          }
        });
      },
      child: Container(
        // Ensure each item has a unique key
        // key: ValueKey(index), 
        color: isSelected ? Colors.grey.shade700 : Colors.transparent,
        child: ListTile(
          leading: Icon(
            Icons.fitness_center,
            color: Colors.white,
          ),
          title: Text(item.name, style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.drag_handle, color: Colors.white),
        ),
      ),
    );
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

  void _deleteSelectedItems() {
    setState(() {
      // workoutItems.removeWhere((_, index) => selectedIndices.contains(index));
      selectedIndices.clear();
    });
  }

  void _makeSuperset() {
    setState(() {
      for (var index in selectedIndices) {
        // workoutItems[index].isSuperset = true;
      }
      selectedIndices.clear();
    });
  }
}

class WorkoutItem {
  final String name;
  final bool isSuperset;

  WorkoutItem({required this.name, required this.isSuperset});
}
