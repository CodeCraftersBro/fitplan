class DurationHelper {
  /// Преобразует количество секунд в строку формата HH:mm:ss
  static String formatDuration(int? durationSeconds) {
    if (durationSeconds == null || durationSeconds == 0) return "00:00:00";

    int hours = durationSeconds ~/ 3600;
    int minutes = (durationSeconds % 3600) ~/ 60;
    int seconds = durationSeconds % 60;

    return "${hours.toString().padLeft(2, '0')}:"
           "${minutes.toString().padLeft(2, '0')}:"
           "${seconds.toString().padLeft(2, '0')}";
  }

  /// Преобразует строку формата HH:mm:ss в количество секунд
  static int parseDuration(String formattedDuration) {
    final parts = formattedDuration.split(':');
    if (parts.length != 3) {
      throw FormatException("Неверный формат времени. Ожидалось HH:mm:ss");
    }

    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = int.tryParse(parts[1]) ?? 0;
    final seconds = int.tryParse(parts[2]) ?? 0;

    return hours * 3600 + minutes * 60 + seconds;
  }
}