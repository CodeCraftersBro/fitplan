import 'package:fitplan/bloc/app_version/app_version_cubit.dart';
import 'package:fitplan/bloc/theme/theme_cubit.dart';
import 'package:fitplan/features/settings/widgets/widgets.dart';
import 'package:fitplan/generated/l10n.dart';
import 'package:fitplan/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
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

    return BlocProvider(
      create: (context) => AppVersionCubit()..fetchAppVersion(),
      child: Scaffold(
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
              onTap: _purchaseSubscription, // Обработчик подписки
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
            BlocBuilder<AppVersionCubit, AppVersionState>(
              builder: (context, state) {
                if (state is AppVersionInitial) {
                  return const CircularProgressIndicator();
                } else if (state is AppVersionLoaded) {
                  return Text(
                    S.of(context).appVersionAndBuildnumber(
                      state.version,
                      state.buildNumber
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  );
                } else if (state is AppVersionError) {
                  return Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  );
                } else {
                  return Text(
                    S.of(context).unknownState,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }


  /// Метод для покупки подписки через RevenueCat
  Future<void> _purchaseSubscription() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      if (offerings.current != null && offerings.current!.availablePackages.isNotEmpty) {
        await Purchases.purchasePackage(offerings.current!.availablePackages.first);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Подписка оформлена! 🎉")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Нет доступных подписок.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ошибка при оформлении подписки: $e")),
      );
    }
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
