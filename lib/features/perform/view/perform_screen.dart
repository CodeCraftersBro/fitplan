import 'dart:developer';

import 'package:fitplan/features/perform/widgets/widgets.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/ui/widgets/drag_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class PerformScreen extends StatefulWidget {
  final String exerciseName; // Название упражнения
  final String exerciseType; // Тип упражнения
  final List<Map<String, String>> existingSets; // Список уже внесенных данных

  const PerformScreen({
    super.key,
    required this.exerciseName,
    required this.exerciseType,
    required this.existingSets,
  });

  @override
  State<PerformScreen> createState() => _PerformScreenState();
}

class _PerformScreenState extends State<PerformScreen> {
  // Для силовых и растяжки
  List<Map<String, TextEditingController>> setsControllers = [];

  @override
  void initState() {
    super.initState();

    _initializeControllers();
  }

  // Инициализация контроллеров с уже внесенными данными
  void _initializeControllers() {
    if (widget.exerciseType == 'Strength' ||
        widget.exerciseType == 'Stretching' ||
        widget.exerciseType == 'Cardio') {
      if (widget.existingSets.isNotEmpty) {
        // Если есть данные, заполняем поля контроллерами с существующими значениями
        for (var set in widget.existingSets) {
          setsControllers.add({
            'weight': TextEditingController(text: set['weight'] ?? ''),
            'reps': TextEditingController(text: set['reps'] ?? ''),
            'distance': TextEditingController(text: set['distance'] ?? ''),
            'duration': TextEditingController(text: set['duration'] ?? ''),
          });
        }
      } else {
        // Если нет данных, инициализируем пустой набор для подходов
        _addSet();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Center(child: DragIndicator()),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Заголовок упражнения
                            Text(
                              widget.exerciseName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 20),
      
                            // Ввод данных в зависимости от типа упражнения
                            if (widget.exerciseType == 'Strength')
                              _buildStrengthFields(),
                            if (widget.exerciseType == 'Cardio')
                              _buildCardioFields(),
                            if (widget.exerciseType == 'Stretching')
                              _buildStretchingFields(),
      
                            const SizedBox(height: 20),
      
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Кнопка добавления подхода
                                FloatingActionButton.extended(
                                  onPressed: _addSet,
                                  tooltip: 'Добавить подход',
                                  label: const Text('Добавить подход'),
                                ),
                                // Кнопка сохранения
                                // FloatingActionButton.extended(
                                //   onPressed: _saveWorkout,
                                //   label: const Text('Сохранить'),
                                //   icon: const Icon(Icons.save),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        // Кнопка "Сохранить" фиксированная внизу экрана
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      
        floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16, // ✅ Двигаем кнопку вверх при появлении клавиатуры
        ),
        child: FloatingActionButton(
          onPressed: _saveWorkout,
          heroTag: 'save',
          tooltip: 'Сохранить',
          child: const Icon(Icons.save),
        ),
      ),
      
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _saveWorkout,
        //   label: const Text('Сохранить'),
        //   icon: const Icon(Icons.save),
        // ),
      ),
    );
  }

  // Поля для ввода данных по типу "Силовые"
  Widget _buildStrengthFields() {
    return Column(
      children: [
        Column(
          children: List.generate(setsControllers.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  // Номер подхода
                  Text(
                    "${index + 1}", // Порядковый номер подхода
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16),
                  // Поле для ввода веса
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Text(S.of(context).weight,
                              style: TextStyle(fontSize: 16)),
                        TextField(
                          controller: setsControllers[index]['weight']!,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Поле для ввода повторений
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          Text(
                            S.of(context).repeats,
                            style: TextStyle(fontSize: 16),
                          ),
                        TextField(
                          controller: setsControllers[index]['reps']!,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        setsControllers.removeAt(index);
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  // Поля для ввода данных по типу "Кардио" с несколькими подходами
  Widget _buildCardioFields1212() {
  return Column(
    children: List.generate(setsControllers.length, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Номер подхода
            Text(
              "${index + 1}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),

            // Поле для ввода дистанции
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Text(S.of(context).distance,
                        style: TextStyle(fontSize: 16)),
                  TextField(
                    controller: setsControllers[index]['distance']!,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            // **Новый выбор времени**
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Text(S.of(context).duration,
                        style: TextStyle(fontSize: 16)),
                  DurationPickerWidget(
                      initialDurationSeconds: 10 ,//setsControllers[index]['time'],
                      onDurationSelected: (seconds) {
                        setState(() {
                          // setsControllers[index]['time'] = 10; //seconds;
                        });
                      },
                    ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  setsControllers.removeAt(index);
                });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
    }),
  );
}

  
  Widget _buildCardioFields111() {
    return Column(
      children: List.generate(setsControllers.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              // Номер подхода
              Text(
                "${index + 1}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              // Поле для ввода дистанции
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      Text(S.of(context).distance,
                          style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: setsControllers[index]['distance']!,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Поле для ввода времени
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      Text(S.of(context).duration,
                          style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: setsControllers[index]['duration']!,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    setsControllers.removeAt(index);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }


Widget _buildCardioFields() {
  return Column(
    children: List.generate(setsControllers.length, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Номер подхода
            Text(
              "${index + 1}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),

            // Поле для ввода дистанции
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Text(S.of(context).distance, style: TextStyle(fontSize: 16)),
                  TextField(
                    controller: setsControllers[index]['distance'],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            // Поле для выбора времени (нажимаем — открывается `TimePickerSpinner`)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0)
                    Text(S.of(context).duration, style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      _showTimePicker(index);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _formatDuration(int.tryParse(setsControllers[index]['duration']!.text) ?? 0),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  setsControllers.removeAt(index);
                });
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      );
    }),
  );
}

  void _showTimePicker(int index) {

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16),
        // height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Duration", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // SizedBox(height: 10),
            TimePickerSpinner(
              // is24HourMode: true,
              // normalTextStyle: TextStyle(fontSize: 16, color: Colors.black),
              // highlightedTextStyle: TextStyle(fontSize: 20, color: Colors.blue),
              // spacing: 5,
              // itemHeight: 40,
              // isForce2Digits: true,
              isShowSeconds:true,
              // is24HourMode: false,
              spacing: 50,
              itemHeight: 80,
              // isForce2Digits: false,
      // minutesInterval: 15,
              onTimeChange: (time) {
                setState(() {
                  setsControllers[index]['duration']!.text =
                      (time.hour * 3600 + time.minute * 60 + time.second).toString();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    },
  );
}

String _formatDuration(int? durationSeconds) {
  if (durationSeconds == null || durationSeconds == 0) return "00:00:00";

  int hours = durationSeconds ~/ 3600;
  int minutes = (durationSeconds % 3600) ~/ 60;
  int seconds = durationSeconds % 60;

  return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
}

  // Поля для ввода данных по типу "Растяжка" с несколькими подходами
  Widget _buildStretchingFields() {
    return Column(
      children: List.generate(setsControllers.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              // Номер подхода
              Text(
                "${index + 1}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              // Поле для ввода времени
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      Text(S.of(context).duration,
                          style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: setsControllers[index]['duration']!,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    setsControllers.removeAt(index);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Метод добавления подхода для всех типов упражнений
  void _addSet() {
    setState(() {
      setsControllers.add({
        'weight': TextEditingController(),
        'reps': TextEditingController(),
        'distance': TextEditingController(),
        'duration': TextEditingController(),
      });
    });
  }

  // Метод сохранения данных
  void _saveWorkout() {
    List<Map<String, String>> sets = [];

    // Для силовых
    if (widget.exerciseType == 'Strength') {
      for (var controllerMap in setsControllers) {
        final weight = controllerMap['weight']!.text;
        final reps = controllerMap['reps']!.text;

        if (weight.isNotEmpty && reps.isNotEmpty) {
          sets.add({'weight': weight, 'reps': reps});
        }
      }
      log("Силовые данные: $sets"); 
    }

    // Для кардио
    if (widget.exerciseType == 'Cardio') {
      for (var controllerMap in setsControllers) {
        final distance = controllerMap['distance']!.text;
        final duration = controllerMap['duration']!.text;

        if (distance.isNotEmpty && duration.isNotEmpty) {
          sets.add({'distance': distance, 'duration': duration});
        }
      }
      log("Кардио данные: $sets"); 
    }

    // Для растяжки
    if (widget.exerciseType == 'Stretching') {
      for (var controllerMap in setsControllers) {
        final duration = controllerMap['duration']!.text;

        if (duration.isNotEmpty) {
          sets.add({'duration': duration});
        }
      }
      log("Растяжка данные: $sets"); 
    }

    Navigator.pop(context, sets);
  }

  @override
  void dispose() {
    // Освобождаем контроллеры для всех типов упражнений
    for (var controllerMap in setsControllers) {
      controllerMap['weight']?.dispose();
      controllerMap['reps']?.dispose();
      controllerMap['distance']?.dispose();
      controllerMap['time']?.dispose();
    }
    super.dispose();
  }
}
