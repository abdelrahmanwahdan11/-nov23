import 'package:flutter/material.dart';
import '../../core/controllers/comparison_controller.dart';
import '../../core/widgets/buttons.dart';

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({super.key, required this.controller});
  final ComparisonController controller;

  @override
  Widget build(BuildContext context) {
    final best = controller.bestMatch();
    return Scaffold(
      appBar: AppBar(title: const Text('Compare tutors')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: controller.selected
                    .map(
                      (tutor) => Container(
                        width: 220,
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(backgroundImage: NetworkImage(tutor.avatarUrl)),
                                const SizedBox(width: 8),
                                Expanded(child: Text(tutor.name, style: Theme.of(context).textTheme.titleMedium)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text('Price: \\$${tutor.pricePerLesson.toStringAsFixed(0)}'),
                            Text('Rating: ${tutor.rating} (${tutor.reviewsCount})'),
                            Text('Lessons: ${tutor.lessonsCount}'),
                            Text('Students: ${tutor.studentsCount}'),
                            Text('Languages: ${tutor.nativeLanguage}, ${tutor.otherLanguages.join(', ')}'),
                            Wrap(children: tutor.tags.map((e) => Chip(label: Text(e))).toList()),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'Book with best match',
              onPressed: best == null ? null : () {},
            ),
          ],
        ),
      ),
    );
  }
}
