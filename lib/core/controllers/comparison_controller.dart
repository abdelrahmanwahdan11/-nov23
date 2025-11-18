import '../utils/models.dart';

class ComparisonController {
  List<Tutor> selected;
  ComparisonController(this.selected);

  Tutor? bestMatch() {
    if (selected.isEmpty) return null;
    selected.sort((a, b) => b.rating.compareTo(a.rating));
    return selected.first;
  }
}
