
import 'package:flutter/material.dart';
final themeLight = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey,
    brightness: Brightness.light,
    primary: Colors.grey.shade900,
    onPrimary: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.grey.shade100,
    onSurface: Colors.black,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    titleMedium: TextStyle(fontSize: 56, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    toolbarTextStyle: TextStyle(fontSize: 18, color: Colors.black),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade900,
    foregroundColor: Colors.white,
    elevation: 6,
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Colors.white,
    textColor: Colors.black,
    iconColor: Colors.black,
    selectedColor: Colors.grey.shade200,
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: Colors.grey.shade900,
  //     foregroundColor: Colors.white,
  //     textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //   ),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.grey.shade900,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // скруглённые углы
    ),
    elevation: 6, // мягкая тень
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Colors.black54),
    labelStyle: const TextStyle(color: Colors.black),
  ),
  
);

final themeDark = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey,
    brightness: Brightness.dark,
    primary: Colors.grey.shade300,
    onPrimary: Colors.black,
    background: Colors.grey.shade900,
    onBackground: Colors.white,
    surface: Colors.grey.shade800,
    onSurface: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    toolbarTextStyle: TextStyle(fontSize: 18, color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade300,
    foregroundColor: Colors.black,
    elevation: 6,
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Colors.grey.shade800,
    textColor: Colors.white,
    iconColor: Colors.white,
    selectedColor: Colors.grey.shade700,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade300,
      foregroundColor: Colors.black,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade800,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Colors.white70),
    labelStyle: const TextStyle(color: Colors.white),
  ),
);
