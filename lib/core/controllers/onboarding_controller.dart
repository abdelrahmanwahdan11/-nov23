import 'dart:async';
import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;
  Timer? _timer;

  void startAutoSlide(int pageCount) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      currentPage = (currentPage + 1) % pageCount;
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
      notifyListeners();
    });
  }

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  void disposeController() {
    _timer?.cancel();
    pageController.dispose();
  }
}
