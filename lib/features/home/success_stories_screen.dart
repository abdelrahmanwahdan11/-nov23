import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';

class SuccessStoriesScreen extends StatelessWidget {
  const SuccessStoriesScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success stories'),
        actions: [
          IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: successStories.length,
        itemBuilder: (context, index) {
          final story = successStories[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(story.avatarUrl), radius: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(story.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('${story.role} • ${story.company}', style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                    Chip(label: Text(story.skills.first)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(story.quote, style: const TextStyle(fontStyle: FontStyle.italic)),
                const SizedBox(height: 8),
                Text(story.highlight),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: story.skills
                      .map((s) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(s, style: const TextStyle(fontWeight: FontWeight.w600)),
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
