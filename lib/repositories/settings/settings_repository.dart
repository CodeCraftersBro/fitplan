import 'package:fitplan/repositories/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository implements SettingsRepositoryInterface {
  final SharedPreferences preferences;

  SettingsRepository({required this.preferences});

  static const darkModeKey = 'darkModeEnabled';

  @override
  Future<bool> getDarkModeEnabled() async {
    return preferences.getBool(darkModeKey) ?? false;
  }

  @override
  Future<void> setDarkModeEnabled(bool enabled) async {
    await preferences.setBool(darkModeKey, enabled);
  }
}
