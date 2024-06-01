
import 'package:fitplan/features/home/bloc/workout_calendar_data_bloc.dart';
import 'package:fitplan/features/home/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/workout/models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<WorkoutCalendarDataBloc, WorkoutCalendarDataState>(
        builder: (context, state) {
          List<Workout> workouts = [];

          if (state is WorkoutCalendarDataLoaded) {
            workouts = state.workouts;
          }

          if (workouts.isNotEmpty) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //  FloatingActionButton(
                //   child: Icon(Icons.edit),
                //   onPressed: () {
                //     _showModalEditExercise(context);
                //   },
                // ),  
                FloatingActionButton.extended(
                  label: const Text(
                    "Добавить упражнение",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    _showModalAddExercise(context);
                  },
                ),
              ],
            );
          } else {
            return FloatingActionButton.extended(
              label: const Text(
                "Добавить упражнение",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                _showModalAddExercise(context);
              },
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: MainScreen(),
    );
  }

 

  void _showModalEditExercise(BuildContext context) {
    // Реализация модального окна для редактирования упражнения
    return ;
  }
  void _showModalAddExercise(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 1.0,
          minChildSize: 0.5,
          maxChildSize: 1.0,
          expand: false,
          builder: (_, controller) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              margin: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  // Индикатор для таскания
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      margin: EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
    
                  // Поле для поиска
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Искать",
                        prefixIcon: Icon(Icons.search,
                            color:
                                Theme.of(context).colorScheme.onSurface),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  // Табы "Упражнения" и "Программы"
    
                  // Кнопка "Создать Упражнения"
                  ElevatedButton(
                    onPressed: () {
                      // Действие при нажатии на кнопку
                    },
                    child: Text("Создать Упражнения"),
                  ),
                  // Список типов упражнений
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10, // Количество элементов в списке
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                              Icons.fitness_center), // Иконка упражнения
                          title: Text(
                              "Категория $index"), // Название упражнения
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  "$index"), // Число упражнений в категории
                              Icon(Icons
                                  .arrow_forward_ios), // Стрелочка вправо
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
