// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My plan`
  String get home {
    return Intl.message('My plan', name: 'home', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Add excrcise`
  String get add_exercise {
    return Intl.message(
      'Add excrcise',
      name: 'add_exercise',
      desc: '',
      args: [],
    );
  }

  /// `Unlimited workouts`
  String get unlimitedWorkouts {
    return Intl.message(
      'Unlimited workouts',
      name: 'unlimitedWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message('Dark theme', name: 'darkTheme', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Enable analytics`
  String get enableAnalytics {
    return Intl.message(
      'Enable analytics',
      name: 'enableAnalytics',
      desc: '',
      args: [],
    );
  }

  /// `Clear history`
  String get clearHistory {
    return Intl.message(
      'Clear history',
      name: 'clearHistory',
      desc: '',
      args: [],
    );
  }

  /// `Developer website`
  String get developerWebsite {
    return Intl.message(
      'Developer website',
      name: 'developerWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Unknown state`
  String get unknownState {
    return Intl.message(
      'Unknown state',
      name: 'unknownState',
      desc: '',
      args: [],
    );
  }

  /// `Application version: {version} ({buildNumber})`
  String appVersionAndBuildnumber(Object version, Object buildNumber) {
    return Intl.message(
      'Application version: $version ($buildNumber)',
      name: 'appVersionAndBuildnumber',
      desc: '',
      args: [version, buildNumber],
    );
  }

  /// `Ring: {ring}`
  String ringWorkout(Object ring) {
    return Intl.message(
      'Ring: $ring',
      name: 'ringWorkout',
      desc: '',
      args: [ring],
    );
  }

  /// `Add`
  String get addExercise {
    return Intl.message('Add', name: 'addExercise', desc: '', args: []);
  }

  /// `No data`
  String get reps_none {
    return Intl.message('No data', name: 'reps_none', desc: '', args: []);
  }

  /// `{count, plural, one {{count} set} other {{count} sets}}`
  String reps_strength(num count) {
    return Intl.plural(
      count,
      one: '$count set',
      other: '$count sets',
      name: 'reps_strength',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {{count} session} other {{count} sessions}}`
  String reps_cardio(num count) {
    return Intl.plural(
      count,
      one: '$count session',
      other: '$count sessions',
      name: 'reps_cardio',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {{count} exercise} other {{count} exercises}}`
  String reps_stretching(num count) {
    return Intl.plural(
      count,
      one: '$count exercise',
      other: '$count exercises',
      name: 'reps_stretching',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, one {{count} rep} other {{count} reps}}`
  String reps_generic(num count) {
    return Intl.plural(
      count,
      one: '$count rep',
      other: '$count reps',
      name: 'reps_generic',
      desc: '',
      args: [count],
    );
  }

  /// `Search`
  String get searchCaption {
    return Intl.message('Search', name: 'searchCaption', desc: '', args: []);
  }

  /// `Nothing found, try again.`
  String get nothingFound {
    return Intl.message(
      'Nothing found, try again.',
      name: 'nothingFound',
      desc: 'Displayed when a search or query returns no results.',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `Distance (m)`
  String get distance {
    return Intl.message('Distance (m)', name: 'distance', desc: '', args: []);
  }

  /// `Repetitions`
  String get repeats {
    return Intl.message('Repetitions', name: 'repeats', desc: '', args: []);
  }

  /// `Weight (kg)`
  String get weight {
    return Intl.message('Weight (kg)', name: 'weight', desc: '', args: []);
  }

  /// `Select duration`
  String get selectDuration {
    return Intl.message(
      'Select duration',
      name: 'selectDuration',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
