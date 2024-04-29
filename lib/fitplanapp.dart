import 'package:fitplan/bloc/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fitplan/router/router.dart';
import 'package:fitplan/ui/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FitPlanApp extends StatefulWidget {
  const FitPlanApp({super.key});

  @override
  State<FitPlanApp> createState() => _FitPlanAppState();
}

class _FitPlanAppState extends State<FitPlanApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: "FitPlan",
            debugShowCheckedModeBanner: false,
            theme: state.isDark ? themeDark : themeLight,
            routes: routes,
          );
        },
      ),
    );
  }
}
