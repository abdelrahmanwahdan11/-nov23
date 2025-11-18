import 'dart:async';
import '../utils/mock_data.dart';
import '../utils/models.dart';

class HomeController {
  final _tutorStream = StreamController<List<Tutor>>.broadcast();
  final _items = <Tutor>[];
  int _page = 0;
  bool _loading = false;

  Stream<List<Tutor>> get stream => _tutorStream.stream;

  void loadInitial() {
    _items.clear();
    _page = 0;
    loadMore();
  }

  Future<void> loadMore() async {
    if (_loading) return;
    _loading = true;
    await Future.delayed(const Duration(milliseconds: 400));
    final start = _page * 6;
    final next = mockTutors.skip(start).take(6).toList();
    if (next.isNotEmpty) {
      _items.addAll(next);
      _tutorStream.add(List.from(_items));
      _page++;
    }
    _loading = false;
  }

  void dispose() {
    _tutorStream.close();
  }
}
