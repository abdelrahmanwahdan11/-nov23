import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import '../utils/models.dart';

class TutorDetailsController extends ChangeNotifier {
  Tutor? current;
  bool favorite = false;
  bool flipped = false;

  void load(String id) {
    current = mockTutors.firstWhere((tutor) => tutor.id == id);
    notifyListeners();
  }

  void toggleFavorite() {
    favorite = !favorite;
    notifyListeners();
  }

  void toggleFlip() {
    flipped = !flipped;
    notifyListeners();
  }
}
