import 'package:flutter/material.dart';
import '../utils/models.dart';

class BookingController extends ChangeNotifier {
  String? selectedLanguage;
  int? duration;
  DateTime? date;
  String? time;

  LessonSession? session;

  final times = ['9:00 AM', '11:00 AM', '2:00 PM', '6:00 PM'];

  bool get ready => selectedLanguage != null && duration != null && date != null && time != null;

  void selectLanguage(String value) {
    selectedLanguage = value;
    notifyListeners();
  }

  void selectDuration(int value) {
    duration = value;
    notifyListeners();
  }

  void selectDate(DateTime value) {
    date = value;
    notifyListeners();
  }

  void selectTime(String value) {
    time = value;
    notifyListeners();
  }

  LessonSession buildSession(String tutorId, double price) {
    session = LessonSession(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      tutorId: tutorId,
      language: selectedLanguage ?? 'Turkish',
      durationMinutes: duration ?? 25,
      date: date ?? DateTime.now(),
      time: time ?? '9:00 AM',
      price: price,
      isTrial: true,
    );
    notifyListeners();
    return session!;
  }
}
