import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/controllers/auth_controller.dart';
import 'core/controllers/booking_controller.dart';
import 'core/controllers/favorites_controller.dart';
import 'core/controllers/localization_controller.dart';
import 'core/controllers/payments_controller.dart';
import 'core/controllers/theme_controller.dart';
import 'core/localization/app_localizations.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/models.dart';
import 'features/auth/auth_screens.dart';
import 'features/booking/book_session_screen.dart';
import 'features/home/main_shell.dart';
import 'features/onboarding/goal_selection_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/payments/payment_screen.dart';
import 'features/payments/success_screen.dart';
import 'features/profile/favorites_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/profile/settings_screen.dart';
import 'features/profile/support_screen.dart';
import 'features/payments/wallet_screen.dart';
import 'features/profile/journal_screen.dart';
import 'features/home/resources_screen.dart';
import 'features/tutor_details/tutor_details_screen.dart';
import 'features/home/notifications_screen.dart';
import 'features/home/learning_path_screen.dart';
import 'features/home/progress_dashboard_screen.dart';
import 'features/booking/planner_screen.dart';
import 'features/home/community_screen.dart';
import 'features/home/practice_lab_screen.dart';
import 'features/home/live_events_screen.dart';
import 'features/home/placement_test_screen.dart';
import 'features/profile/certificates_screen.dart';
import 'features/home/coach_tips_screen.dart';
import 'features/home/insights_screen.dart';

void main() {
  runApp(const LinguaTutorApp());
}

class LinguaTutorApp extends StatefulWidget {
  const LinguaTutorApp({super.key});

  @override
  State<LinguaTutorApp> createState() => _LinguaTutorAppState();
}

class _LinguaTutorAppState extends State<LinguaTutorApp> {
  final themeController = ThemeController();
  final localizationController = LocalizationController();
  final authController = AuthController();
  final favoritesController = FavoritesController();
  bool _onboardingDone = false;
  bool _goalSelected = false;

  @override
  void initState() {
    super.initState();
    themeController.load();
    authController.load();
    authController.addListener(_syncAuthProgress);
  }

  @override
  void dispose() {
    themeController.dispose();
    localizationController.dispose();
    authController.removeListener(_syncAuthProgress);
    authController.dispose();
    favoritesController.dispose();
    super.dispose();
  }

  void _syncAuthProgress() {
    if (authController.isLoggedIn && (!_onboardingDone || !_goalSelected)) {
      setState(() {
        _onboardingDone = true;
        _goalSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([themeController, localizationController, authController]),
      builder: (context, _) {
        return MaterialApp(
          title: 'LinguaTutor',
          theme: buildTheme(primary: themeController.primaryColor),
          darkTheme: buildTheme(primary: themeController.primaryColor, brightness: Brightness.dark),
          themeMode: themeController.mode,
          locale: localizationController.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Navigator(
            pages: _pages(),
            onPopPage: (route, result) => route.didPop(result),
          ),
        );
      },
    );
  }

  List<Page> _pages() {
    final List<Page> stack = [];
    if (!_onboardingDone) {
      stack.add(MaterialPage(
          child: OnboardingStoryScreen(
        onFinished: () => setState(() => _onboardingDone = true),
      )));
      return stack;
    }
    if (!_goalSelected) {
      stack.add(MaterialPage(
          child: GoalSelectionScreen(
        onContinue: () => setState(() => _goalSelected = true),
      )));
      return stack;
    }
    if (!authController.isLoggedIn) {
      stack.add(MaterialPage(
          child: LoginScreen(
        controller: authController,
        onSuccess: () => setState(() {}),
        onGuest: () {
          authController.continueAsGuest();
          setState(() {});
        },
      ))));
      return stack;
    }
    stack.add(MaterialPage(
        child: MainShell(
      onTutorTap: _openTutor,
      onLogout: () => authController.logout(),
      themeController: themeController,
      localizationController: localizationController,
      favoritesController: favoritesController,
      profileBuilder: (setStateCallback) => ProfileHost(
          themeController: themeController,
          localeController: localizationController,
          favoritesController: favoritesController,
          onOpenSettings: () => _openSettings(context),
          onOpenFavorites: () => _openFavorites(context),
          onOpenNotifications: () => _openNotifications(context),
          onOpenLearningPath: () => _openLearningPath(context),
          onOpenSupport: () => _openSupport(context),
          onOpenProgress: () => _openProgress(context),
          onOpenPlanner: () => _openPlanner(context),
          onOpenWallet: () => _openWallet(context),
          onOpenJournal: () => _openJournal(context),
          onOpenResources: () => _openResources(context),
          onOpenCommunity: () => _openCommunity(context),
          onOpenPractice: () => _openPractice(context),
          onOpenCertificates: () => _openCertificates(context),
          onOpenLiveEvents: () => _openLiveEvents(context),
          onOpenPlacementTest: () => _openPlacementTest(context),
          onOpenCoachTips: () => _openCoachTips(context),
          onOpenInsights: () => _openInsights(context),
          onLogout: () {
        setState(() {});
      }),
    )));
    return stack;
  }

  void _openTutor(Tutor tutor) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => TutorDetailsScreen(
        tutor: tutor,
        onBook: () => _startBooking(tutor),
      ),
    ));
  }

  void _startBooking(Tutor tutor) {
    final booking = BookingController();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BookSessionScreen(
        controller: booking,
        onOpenSettings: () => _openSettings(context),
        onConfirm: () {
          final session = booking.buildSession(tutor.id, tutor.pricePerLesson);
          final payments = PaymentsController();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => PaymentScreen(
              controller: payments,
              session: session,
              onOpenSettings: () => _openSettings(context),
              onSuccess: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SuccessScreen())),
            ),
          ));
        },
      ),
    ));
  }

  void _openSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => SettingsScreen(
        themeController: themeController,
        localizationController: localizationController,
        favoritesController: favoritesController,
      ),
    ));
  }

  void _openFavorites(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => FavoritesScreen(
        favoritesController: favoritesController,
        onTutorTap: _openTutor,
      ),
    ));
  }

  void _openNotifications(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const NotificationsScreen(),
    ));
  }

  void _openLearningPath(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const LearningPathScreen(),
    ));
  }

  void _openSupport(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const SupportScreen(),
    ));
  }

  void _openProgress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const ProgressDashboardScreen(),
    ));
  }

  void _openPlanner(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => PlannerScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openWallet(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => WalletScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openJournal(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => JournalScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openResources(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => ResourcesScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openCommunity(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => CommunityScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openPractice(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => PracticeLabScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openLiveEvents(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => LiveEventsScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openPlacementTest(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => PlacementTestScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openCertificates(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => CertificatesScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openCoachTips(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => CoachTipsScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }

  void _openInsights(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => InsightsScreen(onOpenSettings: () => _openSettings(context)),
    ));
  }
}

class ProfileHost extends StatefulWidget {
  const ProfileHost(
      {super.key,
      required this.themeController,
      required this.localeController,
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
      required this.onLogout});
  final ThemeController themeController;
  final LocalizationController localeController;
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
  final VoidCallback onLogout;

  @override
  State<ProfileHost> createState() => _ProfileHostState();
}

class _ProfileHostState extends State<ProfileHost> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([widget.themeController, widget.localeController, widget.favoritesController]),
      builder: (context, _) {
        return ProfileScreen(
          theme: widget.themeController,
          locale: widget.localeController,
          favoritesController: widget.favoritesController,
          onOpenSettings: widget.onOpenSettings,
          onOpenFavorites: widget.onOpenFavorites,
          onOpenNotifications: widget.onOpenNotifications,
          onOpenLearningPath: widget.onOpenLearningPath,
          onOpenSupport: widget.onOpenSupport,
          onOpenProgress: widget.onOpenProgress,
          onOpenPlanner: widget.onOpenPlanner,
          onOpenWallet: widget.onOpenWallet,
          onOpenJournal: widget.onOpenJournal,
          onOpenResources: widget.onOpenResources,
          onOpenCommunity: widget.onOpenCommunity,
          onOpenPractice: widget.onOpenPractice,
          onOpenCertificates: widget.onOpenCertificates,
          onOpenLiveEvents: widget.onOpenLiveEvents,
          onOpenPlacementTest: widget.onOpenPlacementTest,
          onOpenCoachTips: widget.onOpenCoachTips,
          onOpenInsights: widget.onOpenInsights,
          onLogout: widget.onLogout,
        );
      },
    );
  }
}
