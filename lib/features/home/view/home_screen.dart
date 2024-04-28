

import 'package:fitplan/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CalendarFormat _calendarFormat =
  //     CalendarFormat.week; // Установка начального формата календаря как неделя
  CalendarFormat _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("FitPlan"),
            pinned: true,
            // snap: true,
            // floating: true,
            elevation: 2,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Add new entry',
                onPressed: () {
                  Navigator.of(context).pushNamed("/settings");
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Stack(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    headerVisible: false,
                    calendarFormat: _calendarFormat,
                    calendarStyle: CalendarStyle(
                      markerDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary
                      )
                    )
                  ),
                  // CalendarAgenda(
                  //   initialDate: DateTime.now(),
                  //   firstDate: DateTime.now().subtract(Duration(days: 25)),
                  //   lastDate: DateTime.now().add(Duration(days: 20)),
                  //   selectedDayPosition: SelectedDayPosition.center,
                  //   backgroundColor: Colors.red,
                  //   fullCalendar: false,
                  //   onDateSelected: (date) {},
                  // ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverList.builder(
            itemCount: 30,
            itemBuilder: (context, index) => BaseContainer(
              margin: const EdgeInsets.symmetric(horizontal: 8)
                  .copyWith(bottom: 20),
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          child: const Icon(Icons.rocket_launch),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'Название упражения',
                          // style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_drop_down_outlined)
                  ]),
            ),
          )
          // SliverToBoxAdapter(
          //   child: Container(
          //     color: Colors.amber,
          //     padding: const EdgeInsets.all(16.0),
          //     alignment: Alignment.center,
          //     // child: const CupertinoActivityIndicator(), // Для стиля iOS
          //     // Или используйте следующее для стиля Material Design:
          //     // child: const CircularProgressIndicator(),
          //   ),)
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          "Добавить упражнение",
          style: TextStyle(
            fontSize: 18, // Установка размера шрифта
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // Размещение кнопки по центру
    );
  }
}
