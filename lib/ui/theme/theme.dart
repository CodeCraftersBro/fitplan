import 'package:flutter/material.dart';

final themeLight = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey, // Используем серый цвет в качестве основы для генерации цветовой схемы
    brightness: Brightness.light,
    primary: Colors.grey.shade900, // Темно-серый цвет для основных элементов интерфейса
    onPrimary: Colors.white, // Белый цвет для текста и иконок на темно-сером фоне
    background: Colors.white, // Белый цвет фона
    onBackground: Colors.black, // Черный цвет текста на белом фоне
    surface: Colors.grey.shade100, // Светло-серый цвет поверхностей
    onSurface: Colors.black, // Черный цвет текста и иконок на светло-сером фоне
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white, // Белый цвет фона AppBar
    foregroundColor: Colors.black, // Черный цвет текста и иконок AppBar
    shadowColor: Colors.transparent, // Прозрачный цвет тени AppBar
    surfaceTintColor: Colors.transparent, // Прозрачный цвет поверхности AppBar
    titleTextStyle: TextStyle(
      color: Colors.black, // Цвет текста заголовка
      fontSize: 20, // Размер шрифта заголовка
      fontWeight: FontWeight.bold, // Жирность шрифта заголовка
      // fontFamily: 'Roboto', // Семейство шрифтов (если вы хотите использовать нестандартный шрифт)
    ),
    // Если вы хотите задать стиль для других текстовых элементов в AppBar, например, для actions:
    toolbarTextStyle: TextStyle(
      color: Colors.black, // Цвет текста элементов
      fontSize: 18, // Размер шрифта элементов
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade900, // Темно-серый цвет фона для FAB
    foregroundColor: Colors.white, // Белый цвет для иконки и текста на FAB
    elevation: 6, // Высота тени под FAB
    // Если вы хотите изменить размер FAB:
    sizeConstraints: const BoxConstraints.tightFor(
      width: 56.0, // Ширина FAB
      height: 56.0, // Высота FAB
    ),
  ),
);

final ThemeData themeDark = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey, // Используем серый цвет в качестве основы для генерации цветовой схемы
    brightness: Brightness.dark,
    primary: Colors.grey.shade300, // Светло-серый цвет для основных элементов интерфейса
    onPrimary: Colors.black, // Черный цвет текста и иконок на светло-сером фоне
    background: Colors.grey.shade900, // Темно-серый цвет фона
    onBackground: Colors.white, // Белый цвет текста на темно-сером фоне
    surface: Colors.grey.shade800, // Очень темно-серый цвет поверхностей
    onSurface: Colors.white, // Белый цвет текста и иконок на очень темно-сером фоне
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black, 
    foregroundColor: Colors.white, 
    shadowColor: Colors.transparent, 
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Colors.white, // Цвет текста заголовка
      fontSize: 20, // Размер шрифта заголовка
      fontWeight: FontWeight.bold, // Жирность шрифта заголовка
      fontFamily: 'Roboto', // Семейство шрифтов
    ),
    // Для других текстовых элементов в AppBar:
    toolbarTextStyle: TextStyle(
      color: Colors.white, // Цвет текста элементов
      fontSize: 18, // Размер шрифта элементов
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.grey.shade300, // Светло-серый цвет фона для FAB
    foregroundColor: Colors.black, // Черный цвет для иконки и текста на FAB
    elevation: 6, // Высота тени под FAB
    // Если вы хотите изменить размер FAB:
    sizeConstraints: const BoxConstraints.tightFor(
      width: 56.0, // Ширина FAB
      height: 56.0, // Высота FAB
    ),
  ),
);
