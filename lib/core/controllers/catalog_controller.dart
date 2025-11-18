import '../utils/mock_data.dart';
import '../utils/models.dart';

class CatalogController {
  List<Tutor> selectedForComparison = [];
  List<Tutor> get tutors => mockTutors;

  void toggleSelection(Tutor tutor) {
    if (selectedForComparison.contains(tutor)) {
      selectedForComparison.remove(tutor);
    } else if (selectedForComparison.length < 3) {
      selectedForComparison.add(tutor);
    }
  }
}
