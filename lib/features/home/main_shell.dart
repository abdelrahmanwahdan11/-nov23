import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../core/controllers/catalog_controller.dart';
import '../../core/controllers/favorites_controller.dart';
import '../../core/controllers/home_controller.dart';
import '../../core/controllers/localization_controller.dart';
import '../../core/controllers/search_controller.dart';
import '../../core/controllers/theme_controller.dart';
import '../../core/utils/models.dart';
import '../booking/bookings_screen.dart';
import '../catalog/catalog_screen.dart';
import '../profile/favorites_screen.dart';
import '../profile/profile_screen.dart';
import '../profile/settings_screen.dart';
import '../booking/planner_screen.dart';
import '../payments/wallet_screen.dart';
import '../search/search_screen.dart';
import 'learning_path_screen.dart';
import 'notifications_screen.dart';
import 'home_screen.dart';
import 'progress_dashboard_screen.dart';
import '../booking/session_details_screen.dart';
import 'resources_screen.dart';
import 'community_screen.dart';
import 'practice_lab_screen.dart';
import 'live_events_screen.dart';
import 'placement_test_screen.dart';
import '../profile/certificates_screen.dart';
import 'coach_tips_screen.dart';
import 'insights_screen.dart';
import 'streaks_screen.dart';
import 'rewards_screen.dart';
import 'feedback_screen.dart';
import 'leaderboard_screen.dart';
import 'immersion_screen.dart';
import 'mentor_chat_screen.dart';
import 'projects_screen.dart';
import 'capstone_review_screen.dart';
import 'download_kits_screen.dart';
import 'career_center_screen.dart';
import 'interview_prep_screen.dart';
import 'alumni_network_screen.dart';
import 'scholarships_screen.dart';
import 'success_stories_screen.dart';
import 'internships_screen.dart';
import 'industry_news_screen.dart';
import 'mobility_screen.dart';
import 'branding_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({
    super.key,
    required this.onTutorTap,
    required this.onLogout,
    required this.profileBuilder,
    required this.themeController,
    required this.localizationController,
    required this.favoritesController,
  });
  final void Function(Tutor tutor) onTutorTap;
  final VoidCallback onLogout;
  final Widget Function(void Function(void Function()) setStateCallback) profileBuilder;
  final ThemeController themeController;
  final LocalizationController localizationController;
  final FavoritesController favoritesController;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;
  late final CatalogController catalogController;
  late final HomeController homeController;
  late final SearchController searchController;
  late final FavoritesController favoritesController;

  @override
  void initState() {
    super.initState();
    catalogController = CatalogController();
    homeController = HomeController()..loadInitial();
    searchController = SearchController();
    favoritesController = widget.favoritesController;
  }

  @override
  void dispose() {
    homeController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(
        onTutorTap: widget.onTutorTap,
        onOpenSettings: _openSettings,
        onOpenNotifications: _openNotifications,
        onOpenFavorites: _openFavorites,
        onOpenLearningPath: _openLearningPath,
        favoritesController: favoritesController,
        onOpenProgress: _openProgress,
        onOpenPlanner: _openPlanner,
        onOpenWallet: _openWallet,
        onOpenResources: _openResources,
        onOpenCommunity: _openCommunity,
        onOpenPractice: _openPractice,
        onOpenLiveEvents: _openLiveEvents,
        onOpenPlacementTest: _openPlacementTest,
        onOpenCertificates: _openCertificates,
        onOpenCoachTips: _openCoachTips,
        onOpenInsights: _openInsights,
        onOpenStreaks: _openStreaks,
        onOpenRewards: _openRewards,
        onOpenFeedback: _openFeedback,
        onOpenLeaderboard: _openLeaderboard,
        onOpenImmersion: _openImmersion,
        onOpenMentorChat: _openMentorChat,
        onOpenProjects: _openProjects,
        onOpenCapstoneReviews: _openCapstoneReviews,
        onOpenDownloadKits: _openDownloadKits,
        onOpenCareerCenter: _openCareerCenter,
        onOpenInterviewPrep: _openInterviewPrep,
        onOpenAlumniNetwork: _openAlumniNetwork,
        onOpenSuccessStories: _openSuccessStories,
        onOpenScholarships: _openScholarships,
        onOpenInternships: _openInternships,
        onOpenIndustryNews: _openIndustryNews,
        onOpenMobility: _openMobility,
        onOpenBranding: _openBranding,
      ),
      CatalogScreen(
        controller: catalogController,
        onCompare: () {},
        onTutorTap: widget.onTutorTap,
        favoritesController: favoritesController,
        onOpenSettings: _openSettings,
      ),
      BookingsScreen(onOpenSettings: _openSettings, onOpenSession: _openSession, onOpenPlanner: _openPlanner),
      widget.profileBuilder(setState),
    ];

    return Scaffold(
      body: IndexedStack(index: index, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(IconlyBold.category), label: 'Catalog'),
          BottomNavigationBarItem(icon: Icon(IconlyBold.calendar), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(IconlyBold.profile), label: 'Profile'),
        ],
      ),
      floatingActionButton: index == 0
          ? FloatingActionButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SearchScreen(controller: searchController, onBack: () => Navigator.pop(context), onTutorTap: widget.onTutorTap),
              )),
              child: const Icon(IconlyLight.search),
            )
          : null,
    );
  }

  void _openSettings() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => SettingsScreen(
              themeController: widget.themeController,
              localizationController: widget.localizationController,
              favoritesController: favoritesController,
            )));
  }

  void _openNotifications() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const NotificationsScreen()));
  }

  void _openFavorites() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => FavoritesScreen(
              favoritesController: favoritesController,
              onTutorTap: widget.onTutorTap,
            )));
  }

  void _openLearningPath() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LearningPathScreen()));
  }

  void _openProgress() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProgressDashboardScreen()));
  }

  void _openStreaks() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => StreaksScreen(onOpenSettings: _openSettings)));
  }

  void _openRewards() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => RewardsScreen(onOpenSettings: _openSettings)));
  }

  void _openFeedback() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => FeedbackScreen(onOpenSettings: _openSettings)));
  }

  void _openSession(LessonSession session) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => SessionDetailsScreen(
              session: session,
              onOpenSettings: _openSettings,
            )));
  }

  void _openPlanner() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PlannerScreen(onOpenSettings: _openSettings)));
  }

  void _openWallet() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => WalletScreen(onOpenSettings: _openSettings)));
  }

  void _openResources() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ResourcesScreen(onOpenSettings: _openSettings)));
  }

  void _openCommunity() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CommunityScreen(onOpenSettings: _openSettings)));
  }

  void _openPractice() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PracticeLabScreen(onOpenSettings: _openSettings)));
  }

  void _openLiveEvents() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LiveEventsScreen(onOpenSettings: _openSettings)));
  }

  void _openPlacementTest() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PlacementTestScreen(onOpenSettings: _openSettings)));
  }

  void _openCertificates() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => CertificatesScreen(onOpenSettings: _openSettings)));
  }

  void _openCoachTips() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CoachTipsScreen(onOpenSettings: _openSettings)));
  }

  void _openInsights() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => InsightsScreen(onOpenSettings: _openSettings)));
  }

  void _openLeaderboard() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => LeaderboardScreen(onOpenSettings: _openSettings)));
  }

  void _openImmersion() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ImmersionScreen(onOpenSettings: _openSettings)));
  }

  void _openMentorChat() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => MentorChatScreen(onOpenSettings: _openSettings)));
  }

  void _openProjects() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProjectsScreen(onOpenSettings: _openSettings)));
  }

  void _openCapstoneReviews() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CapstoneReviewScreen(onOpenSettings: _openSettings)));
  }

  void _openDownloadKits() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DownloadKitsScreen(onOpenSettings: _openSettings)));
  }

  void _openCareerCenter() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CareerCenterScreen(onOpenSettings: _openSettings)));
  }

  void _openInterviewPrep() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => InterviewPrepScreen(onOpenSettings: _openSettings)));
  }

  void _openAlumniNetwork() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AlumniNetworkScreen(onOpenSettings: _openSettings)));
  }

  void _openSuccessStories() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SuccessStoriesScreen(onOpenSettings: _openSettings)));
  }

  void _openScholarships() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ScholarshipsScreen(onOpenSettings: _openSettings)));
  }

  void _openInternships() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => InternshipsScreen(onOpenSettings: _openSettings)));
  }

  void _openIndustryNews() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => IndustryNewsScreen(onOpenSettings: _openSettings)));
  }

  void _openMobility() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => MobilityScreen(onOpenSettings: _openSettings)));
  }

  void _openBranding() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => BrandingScreen(onOpenSettings: _openSettings)));
  }
}
