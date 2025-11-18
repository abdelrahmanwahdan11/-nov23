import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import '../../core/controllers/onboarding_controller.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/widgets/buttons.dart';

class OnboardingStoryScreen extends StatefulWidget {
  const OnboardingStoryScreen({super.key, required this.onFinished});
  final VoidCallback onFinished;

  @override
  State<OnboardingStoryScreen> createState() => _OnboardingStoryScreenState();
}

class _OnboardingStoryScreenState extends State<OnboardingStoryScreen> {
  late final OnboardingController controller;
  final pages = [
    (
      'https://images.pexels.com/photos/414380/pexels-photo-414380.jpeg',
      'Speak confidently',
      'Short daily sessions help you build muscle memory.',
    ),
    (
      'https://images.pexels.com/photos/1181679/pexels-photo-1181679.jpeg',
      'Pick your tutor',
      'Browse curated Turkish tutors and start instantly.',
    ),
    (
      'https://images.pexels.com/photos/590590/pexels-photo-590590.jpeg',
      'Book with ease',
      'Secure and flexible scheduling with friendly reminders.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller = OnboardingController();
    controller.startAutoSlide(pages.length);
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: pages.length,
              itemBuilder: (_, index) {
                final item = pages[index];
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: Hero(
                        tag: 'hero_$index',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(item.$1, width: double.infinity, fit: BoxFit.cover),
                        ).animate().fadeIn(duration: 400.ms).scale(begin: const Offset(0.98, 0.98)),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.$2, style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 12),
                          Text(item.$3, style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 24),
                          PrimaryButton(label: t.translate('btn_continue'), onPressed: widget.onFinished),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              top: 12,
              right: 12,
              child: TextButton(onPressed: widget.onFinished, child: Text(t.translate('skip'))),
            ),
            Positioned(
              bottom: 32,
              left: 20,
              child: Row(
                children: List.generate(pages.length, (index) {
                  final active = index == controller.currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(right: 8),
                    width: active ? 28 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: active ? Colors.black : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: widget.onFinished,
        child: const Icon(IconlyBold.arrow_right),
      ),
    );
  }
}
