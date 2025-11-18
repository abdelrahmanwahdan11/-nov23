import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/controllers/favorites_controller.dart';
import '../../core/controllers/localization_controller.dart';
import '../../core/controllers/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.themeController, required this.localizationController, required this.favoritesController});

  final ThemeController themeController;
  final LocalizationController localizationController;
  final FavoritesController favoritesController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([themeController, localizationController, favoritesController]),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text('Display', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(value: ThemeMode.light, label: Text('Light')),
                  ButtonSegment(value: ThemeMode.dark, label: Text('Dark')),
                  ButtonSegment(value: ThemeMode.system, label: Text('System')),
                ],
                selected: {themeController.mode},
                onSelectionChanged: (value) => themeController.setThemeMode(value.first),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: AppColors.primaryOptions
                    .map(
                      (color) => GestureDetector(
                        onTap: () => themeController.setPrimaryColor(color),
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(color: themeController.primaryColor == color ? Colors.black : Colors.black12),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              Text('Language', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('English'),
                    selected: localizationController.locale.languageCode == 'en',
                    onSelected: (_) => localizationController.setLocale(const Locale('en')),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('العربية'),
                    selected: localizationController.locale.languageCode == 'ar',
                    onSelected: (_) => localizationController.setLocale(const Locale('ar')),
                  ),
                ],
              ),
              const Divider(height: 32),
              Text('Sessions & alerts', style: Theme.of(context).textTheme.titleMedium),
              SwitchListTile(
                value: true,
                onChanged: (_) {},
                title: const Text('Enable session reminders'),
                subtitle: const Text('Get nudges 10 minutes before class starts.'),
              ),
              SwitchListTile(
                value: true,
                onChanged: (_) {},
                title: const Text('Weekly progress email'),
                subtitle: const Text('Receive a summary of speaking time and streaks.'),
              ),
              ListTile(
                title: const Text('Clear favorite tutors'),
                trailing: const Icon(Icons.delete_outline),
                onTap: () => favoritesController.clear(),
              ),
              ListTile(
                title: const Text('Privacy & security'),
                subtitle: const Text('Your data stays on-device; no external services connected yet.'),
                leading: const Icon(Icons.verified_user_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
