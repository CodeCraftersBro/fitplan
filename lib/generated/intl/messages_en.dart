// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(version, buildNumber) =>
      "Application version: ${version} (${buildNumber})";

  static String m1(ring) => "Ring: ${ring}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addExercise":
            MessageLookupByLibrary.simpleMessage("Добавить упражнение"),
        "add_exercise": MessageLookupByLibrary.simpleMessage("Add excrcise"),
        "appVersionAndBuildnumber": m0,
        "clearHistory": MessageLookupByLibrary.simpleMessage("Clear history"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark theme"),
        "developerWebsite":
            MessageLookupByLibrary.simpleMessage("Developer website"),
        "enableAnalytics":
            MessageLookupByLibrary.simpleMessage("Enable analytics"),
        "home": MessageLookupByLibrary.simpleMessage("My plan"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ringWorkout": m1,
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "support": MessageLookupByLibrary.simpleMessage("Support"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "unknownState": MessageLookupByLibrary.simpleMessage("Unknown state"),
        "unlimitedWorkouts":
            MessageLookupByLibrary.simpleMessage("Unlimited workouts")
      };
}
