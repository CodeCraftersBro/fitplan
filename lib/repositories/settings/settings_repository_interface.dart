abstract interface class SettingsRepositoryInterface {
  Future<bool> getDarkModeEnabled();
  Future<void> setDarkModeEnabled(bool enabled);
}
