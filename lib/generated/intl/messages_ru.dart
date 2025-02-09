// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(version, buildNumber) =>
      "Версия приложения: ${version} (${buildNumber})";

  static String m1(count) =>
      "${Intl.plural(count, one: '${count} сессия', few: '${count} сессии', many: '${count} сессий', other: '${count} сессии')}";

  static String m2(count) =>
      "${Intl.plural(count, one: '${count} повторение', few: '${count} повторения', many: '${count} повторений', other: '${count} повторения')}";

  static String m3(count) =>
      "${Intl.plural(count, one: '${count} подход', few: '${count} подхода', many: '${count} подходов', other: '${count} подхода')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '${count} упражнение', few: '${count} упражнения', many: '${count} упражнений', other: '${count} упражнения')}";

  static String m5(ring) => "Подход: ${ring}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addExercise":
            MessageLookupByLibrary.simpleMessage("Добавить упражнение"),
        "add_exercise":
            MessageLookupByLibrary.simpleMessage("Добавить упражнение"),
        "appVersionAndBuildnumber": m0,
        "clearHistory":
            MessageLookupByLibrary.simpleMessage("Очистить историю"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Темная тема"),
        "developerWebsite":
            MessageLookupByLibrary.simpleMessage("Сайт разработчика"),
        "enableAnalytics":
            MessageLookupByLibrary.simpleMessage("Разрешить аналитику"),
        "home": MessageLookupByLibrary.simpleMessage("Мои тренировки"),
        "notifications": MessageLookupByLibrary.simpleMessage("Уведомления"),
        "reps_cardio": m1,
        "reps_generic": m2,
        "reps_none": MessageLookupByLibrary.simpleMessage("Нет данных"),
        "reps_strength": m3,
        "reps_stretching": m4,
        "ringWorkout": m5,
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "support": MessageLookupByLibrary.simpleMessage("Поддержка"),
        "today": MessageLookupByLibrary.simpleMessage("Сегодня"),
        "unknownState":
            MessageLookupByLibrary.simpleMessage("Неизвестное состояние"),
        "unlimitedWorkouts":
            MessageLookupByLibrary.simpleMessage("Безлимитные тренировки")
      };
}
