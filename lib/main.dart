import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/controllers/auth_controller.dart';
import 'core/controllers/booking_controller.dart';
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
import 'features/profile/profile_screen.dart';
import 'features/tutor_details/tutor_details_screen.dart';

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
        profileBuilder: (setStateCallback) => ProfileHost(themeController: themeController, localeController: localizationController, onLogout: () {
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
}

class ProfileHost extends StatefulWidget {
  const ProfileHost({super.key, required this.themeController, required this.localeController, required this.onLogout});
  final ThemeController themeController;
  final LocalizationController localeController;
  final VoidCallback onLogout;

  @override
  State<ProfileHost> createState() => _ProfileHostState();
}

class _ProfileHostState extends State<ProfileHost> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([widget.themeController, widget.localeController]),
      builder: (context, _) {
        return ProfileScreen(
          theme: widget.themeController,
          locale: widget.localeController,
          onLogout: widget.onLogout,
        );
      },
    );
  }
}
