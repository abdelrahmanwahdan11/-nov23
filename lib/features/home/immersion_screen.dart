import 'package:flutter/material.dart';
import '../../core/utils/mock_data.dart';
import '../../core/utils/models.dart';
import '../../core/widgets/info_tag.dart';

class ImmersionScreen extends StatelessWidget {
  const ImmersionScreen({super.key, required this.onOpenSettings});
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Immersion'),
        actions: [IconButton(onPressed: onOpenSettings, icon: const Icon(Icons.settings_outlined))],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: immersionExperiences.length,
        itemBuilder: (context, index) {
          final ImmersionExperience exp = immersionExperiences[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.08),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Stack(
                    children: [
                      Image.network(exp.imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: InfoTag(label: exp.level),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(exp.title,
                                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                          ),
                          Icon(Icons.map_outlined, color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 6),
                          Text(exp.city, style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(exp.description, style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 18, color: Theme.of(context).colorScheme.primary),
                          const SizedBox(width: 6),
                          Text(exp.dateLabel),
                          const Spacer(),
                          InfoTag(label: exp.isGuided ? 'Guided' : 'Self-led'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
