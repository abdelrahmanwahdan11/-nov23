import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/controllers/localization_controller.dart';
import '../../core/controllers/theme_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.theme, required this.locale, required this.onLogout});
  final ThemeController theme;
  final LocalizationController locale;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 34, backgroundImage: NetworkImage('https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg')),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Guest learner', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('guest@example.com'),
                ],
              ),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text('Edit'))
            ],
          ),
          const SizedBox(height: 20),
          const Text('App language'),
          Row(
            children: [
              ChoiceChip(label: const Text('English'), selected: locale.locale.languageCode == 'en', onSelected: (_) => locale.setLocale(const Locale('en'))),
              const SizedBox(width: 8),
              ChoiceChip(label: const Text('العربية'), selected: locale.locale.languageCode == 'ar', onSelected: (_) => locale.setLocale(const Locale('ar'))),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Theme'),
          Row(
            children: [
              ChoiceChip(label: const Text('Light'), selected: theme.mode == ThemeMode.light, onSelected: (_) => theme.setPrimaryColor(theme.primaryColor)),
              const SizedBox(width: 8),
              ChoiceChip(label: const Text('Dark'), selected: theme.mode == ThemeMode.dark, onSelected: (_) => theme.toggleMode()),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Primary color'),
          Wrap(
            spacing: 10,
            children: AppColors.primaryOptions
                .map((color) => GestureDetector(
                      onTap: () => theme.setPrimaryColor(color),
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black12),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          SwitchListTile(value: true, onChanged: (_) {}, title: const Text('Enable notifications')),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: onLogout, child: const Text('Sign out')),
        ],
      ),
    );
  }
}
