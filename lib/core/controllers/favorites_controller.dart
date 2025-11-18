import 'package:flutter/foundation.dart';
import '../utils/models.dart';

class FavoritesController extends ChangeNotifier {
  final Set<String> _favoriteIds = {};

  bool isFavorite(String id) => _favoriteIds.contains(id);

  void toggle(String id) {
    if (isFavorite(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }

  List<Tutor> favoritesFrom(List<Tutor> tutors) {
    return tutors.where((tutor) => _favoriteIds.contains(tutor.id)).toList();
  }

  void clear() {
    _favoriteIds.clear();
    notifyListeners();
  }
}
