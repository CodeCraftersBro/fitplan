import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:fitplan/repositories/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required SettingsRepositoryInterface settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const ThemeState(Brightness.light)) {
    _init();
  }

  final SettingsRepositoryInterface _settingsRepository;

  Future<void> _init() async {
    try {
      final isDarkModeEnabled = await _settingsRepository.getDarkModeEnabled();
      final brightness = isDarkModeEnabled ? Brightness.dark : Brightness.light;
      emit(ThemeState(brightness));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> setThemeBrightness(Brightness brightness) async {
    try {
      _settingsRepository.setDarkModeEnabled(brightness == Brightness.dark);
      emit(ThemeState(brightness));
    } catch (e) {
      log(e.toString());
    }
  }
}
