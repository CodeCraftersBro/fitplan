import 'dart:developer';

import 'package:fitplan/features/search/bloc/exercise_search_bloc.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/ui/widgets/drag_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  final DateTime selectedDate;
  const SearchScreen({super.key, required this.selectedDate});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();

    // Получение выбранной даты
    DateTime selectedDate = widget.selectedDate;

    // Теперь вы можете использовать selectedDate внутри вашего виджета
    print("Selected Date: $selectedDate");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseSearchBloc, ExerciseSearchState>(
      builder: (context, state) {
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
                  children: [
                    const Center(
                      child: DragIndicator(),
                    ),
                    // Поле для поиска
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (query) {
                             
                            context.read<ExerciseSearchBloc>().add(SearchExercises(query)); 
                          
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).searchCaption,
                          prefixIcon: Icon(Icons.search,
                              color: Theme.of(context).colorScheme.onSurface),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                    // TODO: add tabs Табы "Упражнения" и "Программы"

                    // Список типов упражнений и упражнений

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: BlocBuilder<ExerciseSearchBloc,
                            ExerciseSearchState>(
                          builder: (context, state) {

                           log("📌  StateSearch: " + state.toString());
                            switch (state) {
                              case ExerciseSearchInitial():
                                return const Center(
                                    child: CircularProgressIndicator());
                              case ExerciseSearchLoading():
                                return const Center(
                                    child: CircularProgressIndicator());
                              case ExerciseSearchLoaded():
                                final items = state.items;
                                if (items.isNotEmpty) {
                                  return ListView.builder(
                                      padding:
                                          const EdgeInsets.only(bottom: 100),
                                      itemCount: items.length,
                                      itemBuilder: (context, index) {
                                        final isSelected = context
                                            .read<ExerciseSearchBloc>()
                                            .selectedExercises
                                            .contains(items[index]);
                                        // return Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       vertical: 8, horizontal: 16),
                                        //   child: Container(
                                        //     decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(10),
                                        //       color: Theme.of(context)
                                        //           .colorScheme
                                        //           .surface,
                                        //     ),
                                        //     child: Padding(
                                        //       padding:
                                        //           const EdgeInsets.symmetric(
                                        //               vertical: 0,
                                        //               horizontal: 12),
                                        //       child: Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .spaceBetween,
                                        //         mainAxisSize: MainAxisSize.max,
                                        //         children: [
                                        //           Row(
                                        //             children: [
                                        //               Text(
                                        //                 // items[index].icon,
                                        //                 items[index].typeItem ==
                                        //                         'category'
                                        //                     ? items[index].icon
                                        //                     : "🏋️",
                                        //                 style: const TextStyle(
                                        //                   fontSize: 40,
                                        //                 ),
                                        //               ),
                                        //               const SizedBox(
                                        //                 width: 10,
                                        //               ),
                                        //               Text(
                                        //                 items[index].name,
                                        //                 style: Theme.of(context)
                                        //                     .textTheme
                                        //                     .titleMedium
                                        //                     ?.copyWith(
                                        //                       fontSize: 18,
                                        //                     ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           Row(
                                        //             children: [
                                        //               items[index].typeItem ==
                                        //                       'exercise'
                                        //                   ? Checkbox(
                                        //                       value: isSelected,
                                        //                       onChanged:
                                        //                           (value) {
                                        //                         context
                                        //                             .read<
                                        //                                 ExerciseSearchBloc>()
                                        //                             .add(
                                        //                               ToggleExerciseSelection(
                                        //                                   items[
                                        //                                       index]),
                                        //                             );
                                        //                         setState(() {});
                                        //                       },
                                        //                     )
                                        //                   : IconButton(
                                        //                       icon: Icon(
                                        //                         Icons
                                        //                             .chevron_right,
                                        //                         color: Theme.of(
                                        //                                 context)
                                        //                             .colorScheme
                                        //                             .primary,
                                        //                       ),
                                        //                       onPressed: () {
                                        //                         context
                                        //                             .read<
                                        //                                 ExerciseSearchBloc>()
                                        //                             .add(SelectCategory(
                                        //                                 items[index]
                                        //                                     .exerciseTypeId));
                                        //                       },
                                        //                     )
                                        //             ],
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ),
                                        // );

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          child: InkWell(
                                            onTap: () {
                                              if (items[index].typeItem ==
                                                  'exercise') {
                                                context
                                                    .read<ExerciseSearchBloc>()
                                                    .add(
                                                      ToggleExerciseSelection(
                                                          items[index]),
                                                    );
                                                setState(() {});
                                              } else {
                                                context
                                                    .read<ExerciseSearchBloc>()
                                                    .add(
                                                      SelectCategory(
                                                          items[index]
                                                              .exerciseTypeId),
                                                    );
                                              }
                                            },
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 12),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          items[index].typeItem ==
                                                                  'category'
                                                              ? items[index]
                                                                  .icon
                                                              : "🏋️",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 40),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          items[index].name,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium
                                                                  ?.copyWith(
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        if (items[index]
                                                                .typeItem ==
                                                            'exercise')
                                                          Checkbox(
                                                            value: context
                                                                .read<
                                                                    ExerciseSearchBloc>()
                                                                .selectedExercises
                                                                .contains(items[
                                                                    index]),
                                                            onChanged: (value) {
                                                              context
                                                                  .read<
                                                                      ExerciseSearchBloc>()
                                                                  .add(
                                                                    ToggleExerciseSelection(
                                                                        items[
                                                                            index]),
                                                                  );
                                                              setState(() {});
                                                            },
                                                          )
                                                        else
                                                          Icon(
                                                            Icons.chevron_right,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                } else {
                                  return Center(
                                    child: Text(S.of(context).nothingFound),
                                  );
                                }
                              case ExerciseSearchCategorySelected():
                                final items = state.items;
                                if (items.isNotEmpty) {
                                  return ListView.builder(
                                      padding:
                                          const EdgeInsets.only(bottom: 100),
                                      itemCount: items.length,
                                      itemBuilder: (context, index) {
                                        final isSelected = context
                                            .read<ExerciseSearchBloc>()
                                            .selectedExercises
                                            .contains(items[index]);
                                        // return Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       vertical: 8, horizontal: 16),
                                        //   child: Container(
                                        //     decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(10),
                                        //       color: Theme.of(context)
                                        //           .colorScheme
                                        //           .surface,
                                        //     ),
                                        //     child: Padding(
                                        //       padding:
                                        //           const EdgeInsets.symmetric(
                                        //               vertical: 0,
                                        //               horizontal: 12),
                                        //       child: Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .spaceBetween,
                                        //         mainAxisSize: MainAxisSize.max,
                                        //         children: [
                                        //           Row(
                                        //             children: [
                                        //               const Text(
                                        //                 "🏋️",
                                        //                 style: TextStyle(
                                        //                   fontSize: 40,
                                        //                 ),
                                        //               ),
                                        //               const SizedBox(
                                        //                 width: 10,
                                        //               ),
                                        //               Text(
                                        //                 items[index].name,
                                        //                 style: Theme.of(context)
                                        //                     .textTheme
                                        //                     .titleMedium
                                        //                     ?.copyWith(
                                        //                       fontSize: 18,
                                        //                     ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           Row(
                                        //             children: [
                                        //               // IconButton(
                                        //               //     onPressed: () {},
                                        //               //     icon: Icon(
                                        //               //       Icons.chevron_right,
                                        //               //       color: Theme.of(
                                        //               //               context)
                                        //               //           .colorScheme
                                        //               //           .primary,
                                        //               //     ))
                                        //               Checkbox(
                                        //                       value: isSelected,
                                        //                       onChanged:
                                        //                           (value) {
                                        //                         context
                                        //                             .read<
                                        //                                 ExerciseSearchBloc>()
                                        //                             .add(
                                        //                               ToggleExerciseSelection(
                                        //                                   items[
                                        //                                       index]),
                                        //                             );
                                        //                         setState(() {});
                                        //                       },
                                        //                     )
                                        //             ],
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ),
                                        // );

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          child: InkWell(
                                            onTap: () {
                                              if (items[index].typeItem ==
                                                  'exercise') {
                                                context
                                                    .read<ExerciseSearchBloc>()
                                                    .add(
                                                      ToggleExerciseSelection(
                                                          items[index]),
                                                    );
                                                setState(() {});
                                              } else {
                                                context
                                                    .read<ExerciseSearchBloc>()
                                                    .add(
                                                      SelectCategory(
                                                          items[index]
                                                              .exerciseTypeId),
                                                    );
                                              }
                                            },
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 12),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          items[index].typeItem ==
                                                                  'category'
                                                              ? items[index]
                                                                  .icon
                                                              : "🏋️",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 40),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          items[index].name,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium
                                                                  ?.copyWith(
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        if (items[index]
                                                                .typeItem ==
                                                            'exercise')
                                                          Checkbox(
                                                            value: context
                                                                .read<
                                                                    ExerciseSearchBloc>()
                                                                .selectedExercises
                                                                .contains(items[
                                                                    index]),
                                                            onChanged: (value) {
                                                              context
                                                                  .read<
                                                                      ExerciseSearchBloc>()
                                                                  .add(
                                                                    ToggleExerciseSelection(
                                                                        items[
                                                                            index]),
                                                                  );
                                                              setState(() {});
                                                            },
                                                          )
                                                        else
                                                          Icon(
                                                            Icons.chevron_right,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary,
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                } else {
                                  return Center(
                                    child: Text(S.of(context).nothingFound),
                                  );
                                }

                              case ExerciseSearchError():
                                return Center(
                                    child: Text('Ошибка: ${state.message}'));
                              default:
                                return Center(
                                    child: Text(S.of(context).unknownState));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          floatingActionButton:
              BlocBuilder<ExerciseSearchBloc, ExerciseSearchState>(
            builder: (context, state) {
              if (context
                  .read<ExerciseSearchBloc>()
                  .selectedExercises
                  .isNotEmpty) {
                return FloatingActionButton.extended(
                  onPressed: () {
                    context.read<ExerciseSearchBloc>().add(
                        AddSelectedExercisesToWorkout(
                            exercises: context
                                .read<ExerciseSearchBloc>()
                                .selectedExercises,
                            selectedDate: widget.selectedDate));

                    Navigator.pop(context);
                  },
                  label: Text(
                    S.of(context).addExercise,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
