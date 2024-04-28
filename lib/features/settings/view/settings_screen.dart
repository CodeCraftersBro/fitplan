import 'package:fitplan/features/settings/widgets/widgets.dart';
import 'package:fitplan/ui/ui.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = false; // Состояние переключателя уведомлений
  bool unlimitedTrainingEnabled = false; // Состояние  безлимитных тренировок
  bool analyticsEnabled = true; // Состояние переключателя аналитики
  bool darkThemeEnabled = false; // Состояние переключателя темной темы
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          SettingsToggleCard(
            title: 'Безлимитные тренировки',
            value: unlimitedTrainingEnabled,
            onChanged: (value) {
              setState(() {
                unlimitedTrainingEnabled =
                    value; // Обновление состояния переключателя
              });
            },
          ),
          SettingsToggleCard(
            title: 'Уведомления',
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled =
                    value; // Обновление состояния переключателя
              });
              // Здесь может быть код для включения/отключения уведомлений в приложении
            },
          ),
          SettingsToggleCard(
            title: 'Разрешить аналитику',
            value: true,
            onChanged: (value) {},
          ),
          SettingsToggleCard(
            title: 'Темная тема',
            value: darkThemeEnabled,
            onChanged: (value) {
               setState(() {
                darkThemeEnabled =
                    value; // Обновление состояния переключателя
              });
            },
          ),
          const SizedBox(height: 16),
          SettingsActionCard(
            title: 'Очистить историю',
            iconData: Icons.delete_sweep_outlined,
            iconColor: Theme.of(context).colorScheme.primary,
            onTap: () => _clearHistory(context),
          ),
          SettingsActionCard(
            title: 'Сайт разработчика',
            iconData: Icons.web_asset,
            onTap: () {},
          ),
          SettingsActionCard(
            title: 'Поддержка',
            iconData: Icons.message_outlined,
            onTap: () {
              
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Версия приложения: 0.1.0 (Build 0000)\n'
            'Дата выпуска: 01.01.2024\n'
            // '© 2023 Company Name\n'
            'Для обратной связи: support@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  _clearHistory(BuildContext context) {}
}

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    this.onTap,
    required this.iconData,
    this.iconColor,
  });

  final String title;
  final VoidCallback? onTap;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        child: BaseContainer(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  iconData,
                  color: iconColor ?? theme.hintColor.withOpacity(0.3),
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
