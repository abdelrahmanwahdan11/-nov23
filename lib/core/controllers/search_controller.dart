import 'dart:async';
import '../utils/mock_data.dart';
import '../utils/models.dart';

class SearchController {
  final _stream = StreamController<List<Tutor>>.broadcast();
  Stream<List<Tutor>> get stream => _stream.stream;

  void search(String term) {
    final query = term.toLowerCase();
    final results = mockTutors.where((tutor) {
      return tutor.name.toLowerCase().contains(query) ||
          tutor.tags.any((tag) => tag.toLowerCase().contains(query)) ||
          tutor.shortDescription.toLowerCase().contains(query);
    }).toList();
    _stream.add(results);
  }

  void dispose() {
    _stream.close();
  }
}
