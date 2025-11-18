import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning path')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockMilestones.length,
        itemBuilder: (context, index) {
          final LearningMilestone milestone = mockMilestones[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(milestone.title, style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                    Text('${(milestone.progress * 100).toInt()}%', style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
                const SizedBox(height: 8),
                Text(milestone.subtitle, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    minHeight: 10,
                    value: milestone.progress,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
