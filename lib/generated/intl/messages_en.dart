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

  static String m1(count) =>
      "${Intl.plural(count, one: '${count} session', other: '${count} sessions')}";

  static String m2(count) =>
      "${Intl.plural(count, one: '${count} rep', other: '${count} reps')}";

  static String m3(count) =>
      "${Intl.plural(count, one: '${count} set', other: '${count} sets')}";

  static String m4(count) =>
      "${Intl.plural(count, one: '${count} exercise', other: '${count} exercises')}";

  static String m5(ring) => "Ring: ${ring}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addExercise": MessageLookupByLibrary.simpleMessage("Add"),
    "add_exercise": MessageLookupByLibrary.simpleMessage("Add excrcise"),
    "appVersionAndBuildnumber": m0,
    "clearHistory": MessageLookupByLibrary.simpleMessage("Clear history"),
    "darkTheme": MessageLookupByLibrary.simpleMessage("Dark theme"),
    "developerWebsite": MessageLookupByLibrary.simpleMessage(
      "Developer website",
    ),
    "distance": MessageLookupByLibrary.simpleMessage("Distance (m)"),
    "duration": MessageLookupByLibrary.simpleMessage("Duration"),
    "enableAnalytics": MessageLookupByLibrary.simpleMessage("Enable analytics"),
    "home": MessageLookupByLibrary.simpleMessage("My plan"),
    "nothingFound": MessageLookupByLibrary.simpleMessage(
      "Nothing found, try again.",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "repeats": MessageLookupByLibrary.simpleMessage("Repetitions"),
    "reps_cardio": m1,
    "reps_generic": m2,
    "reps_none": MessageLookupByLibrary.simpleMessage("No data"),
    "reps_strength": m3,
    "reps_stretching": m4,
    "ringWorkout": m5,
    "searchCaption": MessageLookupByLibrary.simpleMessage("Search"),
    "selectDuration": MessageLookupByLibrary.simpleMessage("Select duration"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "support": MessageLookupByLibrary.simpleMessage("Support"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "unknownState": MessageLookupByLibrary.simpleMessage("Unknown state"),
    "unlimitedWorkouts": MessageLookupByLibrary.simpleMessage(
      "Unlimited workouts",
    ),
    "weight": MessageLookupByLibrary.simpleMessage("Weight (kg)"),
  };
}
