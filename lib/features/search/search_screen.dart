import 'package:flutter/material.dart';
import '../../core/controllers/search_controller.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/tutor_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.controller, required this.onBack, required this.onTutorTap});
  final SearchController controller;
  final VoidCallback onBack;
  final void Function(Tutor tutor) onTutorTap;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: widget.onBack),
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Search tutors or tags'),
          onChanged: widget.controller.search,
        ),
      ),
      body: StreamBuilder<List<Tutor>>(
        stream: widget.controller.stream,
        builder: (context, snapshot) {
          final results = snapshot.data ?? [];
          if (results.isEmpty) return const Center(child: Text('Start typing to find tutors'));
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (_, index) => TutorCard(
              tutor: results[index],
              onTap: () => widget.onTutorTap(results[index]),
            ),
          );
        },
      ),
    );
  }
}
