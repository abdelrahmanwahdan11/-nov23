import 'package:flutter/material.dart';
import '../../core/controllers/favorites_controller.dart';
import '../../core/controllers/localization_controller.dart';
import '../../core/controllers/theme_controller.dart';
import '../../core/utils/mock_data.dart';
import '../home/fluency_plan_screen.dart';
import '../home/phrasebook_screen.dart';
import '../home/mastery_readiness_screen.dart';
import '../home/portfolio_showcase_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {super.key,
      required this.theme,
      required this.locale,
      required this.favoritesController,
      required this.onOpenSettings,
      required this.onOpenFavorites,
      required this.onOpenNotifications,
      required this.onOpenLearningPath,
      required this.onOpenSupport,
      required this.onOpenProgress,
      required this.onOpenPlanner,
      required this.onOpenWallet,
      required this.onOpenJournal,
      required this.onOpenResources,
      required this.onOpenCommunity,
      required this.onOpenPractice,
      required this.onOpenCertificates,
      required this.onOpenLiveEvents,
      required this.onOpenPlacementTest,
      required this.onOpenCoachTips,
      required this.onOpenInsights,
      required this.onOpenStreaks,
      required this.onOpenRewards,
      required this.onOpenLeaderboard,
      required this.onOpenImmersion,
      required this.onOpenMentorChat,
      required this.onOpenProjects,
      required this.onOpenCapstoneReviews,
      required this.onOpenDownloadKits,
      required this.onOpenFeedback,
      required this.onLogout});
  final ThemeController theme;
  final LocalizationController locale;
  final FavoritesController favoritesController;
  final VoidCallback onOpenSettings;
  final VoidCallback onOpenFavorites;
  final VoidCallback onOpenNotifications;
  final VoidCallback onOpenLearningPath;
  final VoidCallback onOpenSupport;
  final VoidCallback onOpenProgress;
  final VoidCallback onOpenPlanner;
  final VoidCallback onOpenWallet;
  final VoidCallback onOpenJournal;
  final VoidCallback onOpenResources;
  final VoidCallback onOpenCommunity;
  final VoidCallback onOpenPractice;
  final VoidCallback onOpenCertificates;
  final VoidCallback onOpenLiveEvents;
  final VoidCallback onOpenPlacementTest;
  final VoidCallback onOpenCoachTips;
  final VoidCallback onOpenInsights;
  final VoidCallback onOpenStreaks;
  final VoidCallback onOpenRewards;
  final VoidCallback onOpenLeaderboard;
  final VoidCallback onOpenImmersion;
  final VoidCallback onOpenMentorChat;
  final VoidCallback onOpenProjects;
  final VoidCallback onOpenCapstoneReviews;
  final VoidCallback onOpenDownloadKits;
  final VoidCallback onOpenFeedback;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
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
            title: const Text('Streaks'),
            subtitle: const Text('Keep your daily chain alive'),
            leading: const Icon(Icons.local_fire_department_outlined),
            onTap: onOpenStreaks,
          ),
          ListTile(
            title: const Text('Rewards'),
            subtitle: const Text('Redeem points and perks'),
            leading: const Icon(Icons.workspace_premium_outlined),
            onTap: onOpenRewards,
          ),
          ListTile(
            title: const Text('Leaderboard'),
            subtitle: const Text('See how you rank this week'),
            leading: const Icon(Icons.emoji_events_outlined),
            onTap: onOpenLeaderboard,
          ),
          ListTile(
            title: const Text('Weekly feedback'),
            subtitle: const Text('Share preferences for smarter tips'),
            leading: const Icon(Icons.rate_review_outlined),
            onTap: onOpenFeedback,
          ),
          ListTile(
            title: const Text('Coach tips'),
            subtitle: const Text('Personalized nudges before lessons'),
            leading: const Icon(Icons.lightbulb_outline),
            onTap: onOpenCoachTips,
          ),
          ListTile(
            title: const Text('Insights'),
            subtitle: const Text('Weekly momentum and deltas'),
            leading: const Icon(Icons.query_stats_outlined),
            onTap: onOpenInsights,
          ),
          ListTile(
            title: const Text('Progress dashboard'),
            subtitle: const Text('Achievements and speaking minutes'),
            leading: const Icon(Icons.insights),
            onTap: onOpenProgress,
          ),
          ListTile(
            title: const Text('Fluency plan'),
            subtitle: const Text('Capstone stages and readiness'),
            leading: const Icon(Icons.rocket_launch_outlined),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => FluencyPlanScreen(onOpenSettings: onOpenSettings))),
          ),
          ListTile(
            title: const Text('Planner'),
            subtitle: const Text('See weekly agenda and tasks'),
            leading: const Icon(Icons.calendar_month),
            onTap: onOpenPlanner,
          ),
          ListTile(
            title: const Text('Wallet & receipts'),
            subtitle: const Text('Credits, invoices, payment methods'),
            leading: const Icon(Icons.account_balance_wallet_outlined),
            onTap: onOpenWallet,
          ),
          ListTile(
            title: const Text('Learning journal'),
            subtitle: const Text('Keep quick reflections and wins'),
            leading: const Icon(Icons.menu_book_outlined),
            onTap: onOpenJournal,
          ),
          ListTile(
            title: const Text('Resources library'),
            subtitle: const Text('Audio drills, guides, downloads'),
            leading: const Icon(Icons.library_books_outlined),
            onTap: onOpenResources,
          ),
          ListTile(
            title: const Text('Phrasebook'),
            subtitle: const Text('Essential lines by context'),
            leading: const Icon(Icons.record_voice_over_outlined),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PhrasebookScreen(onOpenSettings: onOpenSettings))),
          ),
          ListTile(
            title: const Text('Community'),
            subtitle: const Text('Swap tips and join challenges'),
            leading: const Icon(Icons.forum_outlined),
            onTap: onOpenCommunity,
          ),
          ListTile(
            title: const Text('Practice lab'),
            subtitle: const Text('Quick drills to prep before lessons'),
            leading: const Icon(Icons.fitness_center_outlined),
            onTap: onOpenPractice,
          ),
          ListTile(
            title: const Text('Mentor chat'),
            subtitle: const Text('Stay in touch with your coach'),
            leading: const Icon(Icons.chat_bubble_outline),
            onTap: onOpenMentorChat,
          ),
          ListTile(
            title: const Text('Guided projects'),
            subtitle: const Text('Hands-on scenarios with tasks'),
            leading: const Icon(Icons.assignment_turned_in_outlined),
            onTap: onOpenProjects,
          ),
          ListTile(
            title: const Text('Capstone reviews'),
            subtitle: const Text('Track mentor notes and next steps'),
            leading: const Icon(Icons.fact_check_outlined),
            onTap: onOpenCapstoneReviews,
          ),
          ListTile(
            title: const Text('Final readiness'),
            subtitle: const Text('Checklist for the final oral defense'),
            leading: const Icon(Icons.flag_circle_outlined),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => MasteryReadinessScreen(onOpenSettings: onOpenSettings)),
            ),
          ),
          ListTile(
            title: const Text('Portfolio vault'),
            subtitle: const Text('Keep scripts, recordings, and PDFs together'),
            leading: const Icon(Icons.folder_special_outlined),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => PortfolioShowcaseScreen(onOpenSettings: onOpenSettings)),
            ),
          ),
          ListTile(
            title: const Text('Offline kits'),
            subtitle: const Text('Download packs for spotty Wi‑Fi'),
            leading: const Icon(Icons.offline_pin_outlined),
            onTap: onOpenDownloadKits,
          ),
          ListTile(
            title: const Text('Immersion'),
            subtitle: const Text('Join guided real-world sprints'),
            leading: const Icon(Icons.public),
            onTap: onOpenImmersion,
          ),
          ListTile(
            title: const Text('Placement test'),
            subtitle: const Text('Confirm your level and refresh recommendations'),
            leading: const Icon(Icons.rule_folder_outlined),
            onTap: onOpenPlacementTest,
          ),
          ListTile(
            title: const Text('Live events'),
            subtitle: const Text('Weekly circles and workshops'),
            leading: const Icon(Icons.event_available_outlined),
            onTap: onOpenLiveEvents,
          ),
          ListTile(
            title: const Text('Certificates'),
            subtitle: const Text('Share badges and completion proofs'),
            leading: const Icon(Icons.verified_outlined),
            onTap: onOpenCertificates,
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
