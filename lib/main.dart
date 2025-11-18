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
import 'features/tutor_details/tutor_details_screen.dart';
import 'features/home/notifications_screen.dart';
import 'features/home/learning_path_screen.dart';

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

  @override
  void initState() {
    super.initState();
    themeController.load();
    authController.load();
  }

  @override
  void dispose() {
    themeController.dispose();
    localizationController.dispose();
    authController.dispose();
    favoritesController.dispose();
    super.dispose();
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
    stack.add(MaterialPage(
        child: OnboardingStoryScreen(
      onFinished: () => setState(() {}),
    )));
    stack.add(MaterialPage(
        child: GoalSelectionScreen(
      onContinue: () => setState(() {}),
    )));
    stack.add(MaterialPage(
        child: LoginScreen(
      controller: authController,
      onSuccess: () => setState(() {}),
      onGuest: () => setState(() {}),
    ))));
    if (authController.isLoggedIn || true) {
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
            onLogout: () {
          setState(() {});
        }),
      )));
    }
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
        onConfirm: () {
          final session = booking.buildSession(tutor.id, tutor.pricePerLesson);
          final payments = PaymentsController();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => PaymentScreen(
              controller: payments,
              session: session,
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
      required this.onLogout});
  final ThemeController themeController;
  final LocalizationController localeController;
  final FavoritesController favoritesController;
  final VoidCallback onOpenSettings;
  final VoidCallback onOpenFavorites;
  final VoidCallback onOpenNotifications;
  final VoidCallback onOpenLearningPath;
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
          onLogout: widget.onLogout,
        );
      },
    );
  }
}
