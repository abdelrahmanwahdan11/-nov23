import 'package:flutter/material.dart';
import '../../core/controllers/favorites_controller.dart';
import '../../core/controllers/localization_controller.dart';
import '../../core/controllers/theme_controller.dart';
import '../../core/utils/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.theme, required this.locale, required this.favoritesController, required this.onOpenSettings, required this.onOpenFavorites, required this.onOpenNotifications, required this.onOpenLearningPath, required this.onOpenSupport, required this.onOpenProgress, required this.onLogout});
  final ThemeController theme;
  final LocalizationController locale;
  final FavoritesController favoritesController;
  final VoidCallback onOpenSettings;
  final VoidCallback onOpenFavorites;
  final VoidCallback onOpenNotifications;
  final VoidCallback onOpenLearningPath;
  final VoidCallback onOpenSupport;
  final VoidCallback onOpenProgress;
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
          ListTile(
            title: const Text('Settings'),
            subtitle: const Text('Theme, language, alerts'),
            leading: const Icon(Icons.settings_outlined),
            onTap: onOpenSettings,
          ),
          ListTile(
            title: const Text('Favorites'),
            subtitle: Text('${favoritesController.favoritesFrom(mockTutors).length} saved tutors'),
            leading: const Icon(Icons.favorite_border),
            onTap: onOpenFavorites,
          ),
          ListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Reminders and platform updates'),
            leading: const Icon(Icons.notifications_active_outlined),
            onTap: onOpenNotifications,
          ),
          ListTile(
            title: const Text('Learning path'),
            subtitle: const Text('Track milestones and streaks'),
            leading: const Icon(Icons.bolt),
            onTap: onOpenLearningPath,
          ),
          ListTile(
            title: const Text('Progress dashboard'),
            subtitle: const Text('Achievements and speaking minutes'),
            leading: const Icon(Icons.insights),
            onTap: onOpenProgress,
          ),
          ListTile(
            title: const Text('Help & support'),
            subtitle: const Text('FAQs, privacy, and live assistance'),
            leading: const Icon(Icons.support_agent),
            onTap: onOpenSupport,
          ),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: onLogout, child: const Text('Sign out')),
        ],
      ),
    );
  }
}
