import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';

class MobilityScreen extends StatelessWidget {
  const MobilityScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global mobility'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: mobilityGuides.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final guide = mobilityGuides[index];
          return Container(
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
                    CircleAvatar(backgroundImage: NetworkImage(guide.imageUrl), radius: 26),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(guide.country, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text('${guide.timeline} • ${guide.advisor}',
                              style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    Chip(label: Text(guide.tag)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('Checklist', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: guide.checklist
                      .map((item) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.check_circle, size: 16),
                                const SizedBox(width: 6),
                                Text(item, style: const TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 10),
                Text("Ask ${guide.advisor.split(' ').first} for country-specific steps.",
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          );
        },
      ),
    );
  }
}
