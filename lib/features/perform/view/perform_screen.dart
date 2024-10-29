import 'package:fitplan/ui/widgets/drag_indicator.dart';
import 'package:flutter/material.dart';

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
            'time': TextEditingController(text: set['time'] ?? ''),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Center(child: DragIndicator()),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Заголовок упражнения
                      Text(
                        widget.exerciseName,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 20),

                      // Ввод данных в зависимости от типа упражнения
                      if (widget.exerciseType == 'Strength')
                        _buildStrengthFields(),
                      if (widget.exerciseType == 'Cardio') _buildCardioFields(),
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
              ],
            ),
          );
        },
      ),
      // Кнопка "Сохранить" фиксированная внизу экрана
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveWorkout,
        label: const Text('Сохранить'),
        icon: const Icon(Icons.save),
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
                          const Text("Вес", style: TextStyle(fontSize: 16)),
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
                          const Text("Повторы",style: TextStyle(fontSize: 16),),
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
                ],
              ),
            );
          }),
        ),
      ],
    );
  }

  // Поля для ввода данных по типу "Кардио" с несколькими подходами
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
                      const Text("Дистанция (км)", style: TextStyle(fontSize: 16)),
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
                      const Text("Время (минуты)", style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: setsControllers[index]['time']!,
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
            ],
          ),
        );
      }),
    );
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
                      const Text("Время (секунды)", style: TextStyle(fontSize: 16)),
                    TextField(
                      controller: setsControllers[index]['time']!,
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
        'time': TextEditingController(),
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
      print("Силовые данные: $sets"); // Для демонстрации, замените на реальную логику
    }

    // Для кардио
    if (widget.exerciseType == 'Cardio') {
      for (var controllerMap in setsControllers) {
        final distance = controllerMap['distance']!.text;
        final time = controllerMap['time']!.text;

        if (distance.isNotEmpty && time.isNotEmpty) {
          sets.add({'distance': distance, 'time': time});
        }
      }
      print("Кардио данные: $sets"); // Для демонстрации
    }

    // Для растяжки
    if (widget.exerciseType == 'Stretching') {
      for (var controllerMap in setsControllers) {
        final time = controllerMap['time']!.text;

        if (time.isNotEmpty) {
          sets.add({'time': time});
        }
      }
      print("Растяжка данные: $sets"); // Для демонстрации
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
