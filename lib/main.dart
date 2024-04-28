
import 'package:fitplan/router/router.dart';
import 'package:fitplan/ui/theme/theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FitPlan",
      debugShowCheckedModeBanner: false,
      theme: themeDark,
      // home: const HomeScreen(),
      routes: routes,
    );
  }
}
