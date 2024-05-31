import 'package:fitplan/bloc/theme/theme_cubit.dart';
import 'package:fitplan/features/settings/widgets/widgets.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = false; // Состояние переключателя уведомлений
  bool analyticsEnabled = false; // Состояние переключателя аналитики

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          SettingsActionCard(
            title: S.of(context).unlimitedWorkouts,
            iconData: Icons.rocket_launch,
            iconColor: Colors.red,
            onTap: () {},
          ),
          SettingsToggleCard(
            title: S.of(context).darkTheme,
            value: isDarkTheme,
            onChanged: (value) {
              _setThemeBrightness(context, value);
            },
          ),
          SettingsToggleCard(
            title: S.of(context).notifications,
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          SettingsToggleCard(
            title: S.of(context).enableAnalytics,
            value: analyticsEnabled,
            onChanged: (value) {
              setState(() {
                analyticsEnabled = value;
              });
            },
          ),
          const SizedBox(height: 16),
          SettingsActionCard(
            title: S.of(context).clearHistory,
            iconData: Icons.delete_sweep_outlined,
            iconColor: Theme.of(context).colorScheme.primary,
            onTap: () => _clearHistory(context),
          ),
          SettingsActionCard(
            title: S.of(context).developerWebsite,
            iconData: Icons.web_asset,
            onTap: () {},
          ),
          SettingsActionCard(
            title: S.of(context).support,
            iconData: Icons.message_outlined,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          const Text(
            "Версия приложения: 0.1.0 (Build 0000)"
            // 'Дата выпуска: 01.01.2024\n'
            // '© 2023 Company Name\n'
            // 'Для обратной связи: support@example.com',
            ,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  void _setThemeBrightness(BuildContext context, bool value) {
    context.read<ThemeCubit>().setThemeBrightness(
          value ? Brightness.dark : Brightness.light,
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
